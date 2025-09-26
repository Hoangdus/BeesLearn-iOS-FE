//
//  LoginViewModel.swift
//  BeesLearn
//
//  Created by Nguyễn Hưng on 19/10/2024.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    func Login(email: String, password: String) {
        if email == "Beeslearn@example.com" && password == "password" {
            isLoggedIn = true
        } else {
            print("Login failed")
        }
    }
}
