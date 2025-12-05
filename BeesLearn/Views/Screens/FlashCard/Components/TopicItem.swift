//
//  TopicItem.swift
//  BeesLearn
//
//  Created by HoangDus on 5/12/25.
//

import SwiftUI

struct TopicItem: View {
//    var action: () -> Void
    
    var body: some View {
//        Button(action: {
//            action()
//        }, label: {
//            
//        })
        RoundedRectangle(cornerRadius: 10)
            .fill(Color("AppPrimaryColor"))
            .shadow(color: Color("ShadowColor"), radius: 3, y: 3)
            .overlay(content: {
                VStack{
                    Text("test")
                        .foregroundColor(Color("AccentColor"))
                        .font(Font.custom("Nunito-Bold", size: 30))
                }
                .padding()
            })
    }
}

#Preview {
    TopicItem()
}
