//
//  FillInTheBlank.swift
//  BeesLearn
//
//  Created by HoangDus on 6/10/25.
//

import SwiftUI

struct FillInTheBlank: View {
    @StateObject var viewModel: FillInTheBlankViewModel
    var onCompleteQuestion: (_ answer: String)->Void
    
    init(question: FillInTheBlankQuestion, onCompleteQuestion: @escaping (_: String) -> Void){
        self._viewModel = StateObject(wrappedValue: FillInTheBlankViewModel(question: question))
        self.onCompleteQuestion = onCompleteQuestion
    }
    
    var body: some View {
        GeometryReader{ geo in
            let buttonBrightness = 0.15
            let parentWidth = geo.size.width
//            let parentHeight = geo.size.height
            
            VStack{
                QuestionBox(
                    question: viewModel.question,
                    content: viewModel.wordsInSentence.joined(separator: " "),
                    vietnameseMeaning: viewModel.vietnameseContext
                )
                Spacer()
                AnswerButton(answer: viewModel.answers[0], width: parentWidth * 0.8, action: { answer in
                    viewModel.selectAnswer(answer: answer, index: 1)
                })
                .brightness(viewModel.selectedAnswerIndex == 1 ? buttonBrightness : 0)
                AnswerButton(answer: viewModel.answers[1], width: parentWidth * 0.8, action: { answer in
                    viewModel.selectAnswer(answer: answer, index: 2)
                })
                .brightness(viewModel.selectedAnswerIndex == 2 ? buttonBrightness : 0)
                AnswerButton(answer: viewModel.answers[2], width: parentWidth * 0.8, action: { answer in
                    viewModel.selectAnswer(answer: answer, index: 3)
                })
                .brightness(viewModel.selectedAnswerIndex == 3 ? buttonBrightness : 0)
                Spacer()
                CheckAnswerButton(width: parentWidth * 0.9){
                    if(viewModel.selectedAnswer != nil){
                        print(viewModel.selectedAnswer!)
                    }
                }
                .disabled(viewModel.selectedAnswer != nil ? false : true)
                .brightness(viewModel.selectedAnswer != nil ? 0 : -0.5)
            }
            .padding(.bottom, 20)
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

fileprivate struct AnswerButton: View {
    var answer: String
    var width: CGFloat
    var action: (_ answer: String) -> Void
    
    var body: some View {
        Button(action: {
            action(answer)
        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("AppPrimaryColor"))
                    .shadow(color: Color("ShadowColor"), radius: 3, y: 3)
                Text(answer)
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Nunito-Bold", size: 21))
                    .foregroundStyle(Color("AccentColor"))
            }
            
        })
        .frame(width: width, height: 40)
    }
}

#Preview {
    FillInTheBlank(
        question: FillInTheBlankQuestion(
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting.",
            vietnameseMeaning: "Lorem Ipsum chỉ đơn giản là văn bản giả dùng cho việc in ấn và sắp chữ.",
            possibleAnswers: ["test1", "test2"]),
        onCompleteQuestion: { _ in
            
        }
    )
}
