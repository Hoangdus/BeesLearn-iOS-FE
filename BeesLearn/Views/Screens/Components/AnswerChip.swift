//
//  AnswerChip.swift
//  BeesLearn
//
//  Created by HoangDus on 17/10/25.
//

import SwiftUI

struct AnswerChipView: View {
    var answer: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack{
                Text(answer)
                    .font(Font.custom("Nunito-Bold", size: 15))
                    .foregroundStyle(Color("AccentColor"))
                    .padding(10)
                    .background(){
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("AppPrimaryColor"))
                            .shadow(color: Color("ShadowColor"), radius: 3, y: 3)
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("AccentColor"), lineWidth: 2)
                            })
                    }
            }
            .frame(height: 40)
        })
    }
}
