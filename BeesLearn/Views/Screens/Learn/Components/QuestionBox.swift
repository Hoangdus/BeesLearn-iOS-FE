//
//  QuestionBox.swift
//  BeesLearn
//
//  Created by HoangDus on 6/10/25.
//


import SwiftUI

struct QuestionBox: View {
    var question: String
    var content: String
    var vietnameseMeaning: String = ""
    var width: CGFloat = 300
    var height: CGFloat = 200
    
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
                    .multilineTextAlignment(.center)
                if (!vietnameseMeaning.isEmpty){
                    Text(vietnameseMeaning)
                        .font(Font.custom("Nunito-Bold", size: 20))
                        .foregroundStyle(Color("AccentColor"))
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }
            .padding(.top, 40)
            .padding([.leading, .trailing], 10)
        }
        .frame(width: width, height: height)
    }
}
