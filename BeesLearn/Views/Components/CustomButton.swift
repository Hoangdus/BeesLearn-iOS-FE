//
//  CustomButton.swift
//  BeesLearn
//
//  Created by Nguyễn Hưng on 08/10/2024.
//

import SwiftUI


struct CustomButton: View {
    var text: String
    var action: () -> Void
    
    
    var body: some View {
        Button(action: {
//            print("Button was tapped!")
            action()
        }) {
            Text(text)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .font(Font.custom("Nunito-Bold", size: 18))
                .padding(.vertical, 12)
                .background(Color(hex: "#FFD528"))
                .foregroundColor(.white)
                .cornerRadius(7)
                .shadow(color: Color.black.opacity(0.25), radius: 5, x: 0, y: 5)
        }
    }
}

#Preview {
    CustomButton(text: "Login", action: {
            print("Button was tapped!")
        })
}
