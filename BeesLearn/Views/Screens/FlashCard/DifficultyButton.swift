//
//  DifficultyButton.swift
//  BeesLearn
//
//  Created by HoangDus on 5/12/25.
//

import SwiftUI

struct DifficultyButton: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("AppPrimaryColor"))
                .shadow(color: Color("ShadowColor"), radius: 3, y: 3)
            Text("Test")
                .multilineTextAlignment(.center)
                .font(Font.custom("Nunito-Bold", size: 21))
                .foregroundStyle(Color("AccentColor"))
                .background(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("AppPrimaryColor"))
                        .shadow(color: Color("ShadowColor"), radius: 3, y: 3)
                })
        }
    }
}

#Preview {
    DifficultyButton()
}
