//
//  CustomButtonLogin.swift
//  BeesLearn
//
//  Created by Nguyễn Hưng on 07/10/2024.
//

import SwiftUI

struct CustomButtonLogin: View {
    var image: String
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        HStack(alignment: .center) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 21, height: 21)
                .foregroundColor(.white)
            
            Spacer().frame(width: 20)
            
            
            Text(title)
                .font(Font.custom("Nunito-Bold", size: 14))
                .foregroundColor(textColor)
            
            Spacer()
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 20)
        .padding(.leading, 70)
        .background(backgroundColor)
        .cornerRadius(100)
        .padding(.horizontal, 40)
        
        
        
    }
}

#Preview {
    CustomButtonLogin(image: "facebook", title: "Login With Facebook", backgroundColor: Color("AppPrimaryColor"), textColor: Color.white)
    
}
