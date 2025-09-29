//
//  CustomTextField.swift
//  BeesLearn
//
//  Created by Nguyễn Hưng on 08/10/2024.
//

import SwiftUI

struct CustomTextField: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    var isPasswordField: Bool
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        VStack{
            HStack {
                Text(title)
                    .font(Font.custom("Nunito-Bold", size: 14))
                
                Spacer()
            }
//                .padding(.bottom, 10)
            
            
            HStack {
                if isPasswordField && !isPasswordVisible {
                    SecureField(placeholder, text: $text)
                        .font(Font.custom("Nunito-Bold", size: 14))
                } else {
                    TextField(placeholder, text: $text)
                        .font(Font.custom("Nunito-Bold", size: 14))
                }
                
                if isPasswordField {
                    Button(action: {isPasswordVisible.toggle()}) {
                        Text(isPasswordVisible ? "Hide" : "Show")
                            .foregroundStyle(Color("AppPrimaryColor"))
                            .font(Font.custom("Nunito-Bold", size: 14))
                    }
                }
            }
            
            Divider()
                .background(Color.black)
                .padding(.bottom, 15)
        }
        
    }
}

#Preview {
    @Previewable @State var text = ""
    return CustomTextField(title: "Email", placeholder: "Enter your email", text: $text, isPasswordField: true)
    
}
