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
                ScrollViewReader{ proxy in
                    ScrollView(.horizontal){
                        LazyHStack(spacing: 0){
                            ForEach(hostViewModel.questions){ question in
                                if(question is TrueFalseQuestion){
                                    TrueFalse(question: question as! TrueFalseQuestion, onCompleteQuestion: { correctness in
                                        if(correctness){
                                            print("True false question is correct")
                                        }else{
                                            print("True false question is incorrect")
                                        }
                                        hostViewModel.CompleteQuestion()
                                    })
                                    .frame(width: geometry.size.width)
                                    .id(question.id)
                                }else{
                                    MultipleChoices(question: question as! MultipleChoiceQuestion, onCompleteQuestion: { correctness in 
                                        hostViewModel.CompleteQuestion()
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
                    .allowsHitTesting(hostViewModel.progress == 1 ? false : true)
                    .scrollDisabled(true)
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
