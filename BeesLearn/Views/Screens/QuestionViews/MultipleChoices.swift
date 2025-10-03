//
//  MultipleChoices.swift
//  BeesLearn
//
//  Created by HoangDus on 3/10/25.
//

import SwiftUI

struct MultipleChoices: View {
    var body: some View {
        VStack{
            Spacer()
            QuestionBox(question: "This is a test", content: "test")
            Spacer()
            Grid(horizontalSpacing: 20, verticalSpacing: 20){
                GridRow{
                    AnswerButtonView(answer: "Text1"){ answer in
                        print(answer)
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

struct QuestionBox: View {
    var question: String
    var content: String
    
    var body: some View {
        ZStack(alignment: .center){
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("AppPrimaryColor"))
                .shadow(color: Color("ShadowColor"), radius: 3, y: 3)
            VStack(spacing: 20){
                Text(question)
                    .font(Font.custom("Nunito-Bold", size: 21))
                    .foregroundStyle(Color("AccentColor"))
                Text(content)
                    .font(Font.custom("Nunito-Bold", size: 20))
                    .foregroundStyle(Color("AccentColor"))
                Spacer()
            }
            .padding(.top, 40)
        }
        .frame(width: 300, height: 200)
    }
}

struct AnswerButtonView: View {
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
    MultipleChoices()
}
