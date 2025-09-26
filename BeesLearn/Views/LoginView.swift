//
//  LoginView.swift
//  BeesLearn
//
//  Created by Nguyễn Hưng on 08/10/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @StateObject private var viewModel = LoginViewModel()
    @State private var navigateToTabView = false
    
    var body: some View {
        NavigationStack {
            
            
            Image("logo")
                .resizable()
                .frame(width: 261, height: 261)
                .padding(.bottom, 40)
            
            VStack{
                CustomTextField(title: "Email", placeholder: "Enter your email", text: $email, isPasswordField: false)
                CustomTextField(title: "Password", placeholder: "Enter your password", text: $password, isPasswordField: true)
                
                HStack {
                    Text("Forgot password?")
                        .font(Font.custom("Nunito-Bold", size: 12))
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.top, -20)
                .padding(.bottom, 50)
                
                
                CustomButton(text: "Login", action: {
                    viewModel.Login(email: email, password: password)
                    if viewModel.isLoggedIn {
                        withAnimation{
                            navigateToTabView = true
                        }
                    }
                })
                
                HStack{
                    Text("Don't you have an account? ")
                        .font(Font.custom("Nunito-Bold", size: 12))
                    
                    Text("Sign up")
                        .font(Font.custom("Nunito-Bold", size: 12))
                        .foregroundStyle(Color(hex: "#F8A724"))
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 50)
            
            }
        .navigationDestination(isPresented: $navigateToTabView) {
            CustomTabView()
//                .transition(.slide)
                .navigationBarBackButtonHidden(true)
        }
        
    }
}

#Preview {
    LoginView()
}
