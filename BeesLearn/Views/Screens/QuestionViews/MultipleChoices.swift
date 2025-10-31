//
//  MultipleChoices.swift
//  BeesLearn
//
//  Created by HoangDus on 3/10/25.
//

import SwiftUI

struct MultipleChoices: View {
    var question: MultipleChoiceQuestion
    var onCompleteQuestion: (_ correctness: Bool)->Void
    var body: some View {
        VStack{
//            Spacer()
            QuestionBox(question: question.question, content: question.content)
            Spacer()
            Grid(horizontalSpacing: 20, verticalSpacing: 20){
                GridRow{
                    AnswerButtonView(answer: question.possibleAnswers[0]){ answer in
                        print(answer)
                        onCompleteQuestion(true)
                    }
                    AnswerButtonView(answer: question.possibleAnswers[1]){ answer in
                        print(answer)
                        onCompleteQuestion(true)
                    }
                }
                GridRow{
                    AnswerButtonView(answer: question.possibleAnswers[2]){ answer in
                        print(answer)
                        onCompleteQuestion(true)
                    }
                    AnswerButtonView(answer: question.possibleAnswers[3]){ answer in
                        print(answer)
                        onCompleteQuestion(true)
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
