//
//  CheckAnswerButton.swift
//  BeesLearn
//
//  Created by HoangDus on 15/10/25.
//

import SwiftUI

struct CheckAnswerButton: View {
    var width: CGFloat
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("AppPrimaryColor"))
                    .shadow(color: Color("ShadowColor"), radius: 3, y: 3)
                Text("Kiểm tra")
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Nunito-Bold", size: 21))
                    .foregroundStyle(Color("AccentColor"))
            }
            
        })
        .frame(width: width, height: 60)
    }
}
