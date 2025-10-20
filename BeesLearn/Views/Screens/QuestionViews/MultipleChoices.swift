//
//  MultipleChoices.swift
//  BeesLearn
//
//  Created by HoangDus on 3/10/25.
//

import SwiftUI

struct MultipleChoices: View {
    var onCompleteQuestion: ()->Void
    var body: some View {
        VStack{
//            Spacer()
            QuestionBox(question: "This is a test", content: "test")
            Spacer()
            Grid(horizontalSpacing: 20, verticalSpacing: 20){
                GridRow{
                    AnswerButtonView(answer: "Text1"){ answer in
                        print(answer)
                        onCompleteQuestion()
                    }
                    AnswerButtonView(answer: "Text2"){ answer in
                        print(answer)
                    }
                }
                GridRow{
                    AnswerButtonView(answer: "Text3"){ answer in
                        print(answer)
                    }
                    AnswerButtonView(answer: "Text4"){ answer in
                        print(answer)
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

#Preview {
    MultipleChoices(){}
}
