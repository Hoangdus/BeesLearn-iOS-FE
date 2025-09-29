//
//  WelcomeView.swift
//  BeesLearn
//
//  Created by Nguyễn Hưng on 05/10/2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
//                Color.AppPrimaryColor
//                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//                
                VStack {
                    Text("Bắt đầu học cùng")
                        .font(Font.custom("Nunito-Bold", size: 32))
                        .foregroundStyle(Color("KeyColor"))
                    
                    Text("Bee !")
                        .font(Font.custom("Nunito-Bold", size: 32))
                        .foregroundStyle(Color("KeyColor"))
                    
                    NavigationLink(destination: LoginView()) {
                        CustomButtonLogin(image: "email", title: "Login With Email", backgroundColor: Color("KeyColor"), textColor: Color.white)
                    }
                    
                    CustomButtonLogin(image: "apple", title: "Login With Apple", backgroundColor: Color(.black), textColor: Color.white)
                    
                    CustomButtonLogin(image: "facebook", title: "Login With Facebook", backgroundColor: Color("AppPrimaryColor"), textColor: Color.white)
                    
                    CustomButtonLogin(image: "google", title: "Login With Google", backgroundColor: Color(.white), textColor: Color.black)
                }
                
            }
        }
    }
}

#Preview {
    WelcomeView()
}
