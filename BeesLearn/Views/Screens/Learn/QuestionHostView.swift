//
//  QuestionHostView.swift
//  BeesLearn
//
//  Created by HoangDus on 2/10/25.
//

import SwiftUI

struct QuestionHostView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var hostViewModel = QuestionHostViewModel()
    
    var body: some View {
        VStack(){
            ProgressNavigationBar(progress: hostViewModel.progress){
                dismiss()
            }
            
            GeometryReader{ geometry in
                if(hostViewModel.questions.isEmpty){
                    ProgressView()
                        .tint(Color("ButtonColor"))
                        .controlSize(.large)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }else{
                    ScrollViewReader{ proxy in
                        ScrollView(.horizontal){
                            LazyHStack(spacing: 0){
                                ForEach(hostViewModel.questions){ question in
                                    if(question is TrueFalseQuestion){
                                        TrueFalse(question: question as! TrueFalseQuestion, onCompleteQuestion: { correctness in
                                            hostViewModel.checkAnswer(answer: correctness)
                                        })
                                        .frame(width: geometry.size.width)
                                        .id(question.id)
                                    }else if(question is MultipleChoiceQuestion){
                                        MultipleChoices(question: question as! MultipleChoiceQuestion, onCompleteQuestion: { answer in
                                            hostViewModel.checkAnswer(answer: answer)
                                        })
                                        .frame(width: geometry.size.width)
                                        .id(question.id)
                                    }else if(question is ArrangeQuestion){
                                        ArrangeWords(question: question as! ArrangeQuestion, onCompleteQuestion: { answer in
                                            hostViewModel.checkAnswer(answer: answer)
                                        })
                                        .frame(width: geometry.size.width)
                                        .id(question.id)
                                    }else if(question is FillInTheBlankQuestion){
                                        FillInTheBlank(question: question as! FillInTheBlankQuestion, onCompleteQuestion: { answer in
                                            hostViewModel.checkAnswer(answer: answer)
                                        })
                                        .frame(width: geometry.size.width)
                                        .id(question.id)
                                    }
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .onChange(of: hostViewModel.nextQuestionID, {
                            withAnimation(.default, {
                                proxy.scrollTo(hostViewModel.nextQuestionID)
                            })
                        })
                        .scrollTargetBehavior(.viewAligned)
                        .scrollIndicators(.hidden)
                        .allowsHitTesting(hostViewModel.result != nil ? false : true)
                        .scrollDisabled(true)
                        .overlay(alignment: .bottom){
                            if(hostViewModel.result != nil){
                                ResultPopUp(correctness: hostViewModel.result!, action: {
                                    hostViewModel.CompleteQuestion()
                                })
                            }
                        }
                    }
                }
            }
        }
        .background(Color("BackgroundColor"))
        .toolbar(.hidden, for: .navigationBar)
        .onChange(of: hostViewModel.dismissQuestionHostView) { old, new  in
            if new {
                dismiss()
            }
        }
    }
}

#Preview {
    QuestionHostView()
}
