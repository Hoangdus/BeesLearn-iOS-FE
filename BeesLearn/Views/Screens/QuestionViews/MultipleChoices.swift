//
//  MultipleChoices.swift
//  BeesLearn
//
//  Created by HoangDus on 3/10/25.
//

import SwiftUI

struct MultipleChoices: View {
    var question: MultipleChoiceQuestion
    var onCompleteQuestion: (_ answer: String)->Void
    var body: some View {
        VStack{
//            Spacer()
            QuestionBox(question: question.question, content: question.content)
            Spacer()
            Grid(horizontalSpacing: 20, verticalSpacing: 20){
                GridRow{
                    AnswerButtonView(answer: question.possibleAnswers[0]){ answer in
                        onCompleteQuestion(answer)
                    }
                    AnswerButtonView(answer: question.possibleAnswers[1]){ answer in
                        onCompleteQuestion(answer)
                    }
                }
                GridRow{
                    AnswerButtonView(answer: question.possibleAnswers[2]){ answer in
                        onCompleteQuestion(answer)
                    }
                    AnswerButtonView(answer: question.possibleAnswers[3]){ answer in
                        onCompleteQuestion(answer)
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}


fileprivate struct AnswerButtonView: View {
    var answer: String
    var action: (String) -> Void
    
    var body: some View {
        Button(action: {
            action(answer)
        },label: {
            ZStack(alignment: .center){
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("AppPrimaryColor"))
                    .shadow(color: Color("ShadowColor"), radius: 3, y: 3)
                Text(answer)
                    .font(Font.custom("Nunito-Bold", size: 20))
                    .foregroundStyle(Color("AccentColor"))
            }
            .frame(height: 100)
        })
    }
}

//#Preview {
//    MultipleChoices(){}
//}
