//
//  TitleText.swift
//  BeesLearn
//
//  Created by HoangDus on 5/12/25.
//

import SwiftUI

struct TitleText: View {
    let text: String
    var body: some View {
        VStack{
            Spacer()
            Text(text)
                .font(Font.custom("Nunito-Bold", size: 32))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 30)
    }
}

#Preview {
    TitleText(text: "test")
}
