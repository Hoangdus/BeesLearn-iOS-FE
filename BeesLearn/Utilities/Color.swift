//
//  Color.swift
//  BeesLearn
//
//  Created by Nguyễn Hưng on 05/10/2024.
//

import SwiftUI

import SwiftUI

extension Color {
    static let AppPrimaryColor = Color("AppPrimaryColor")
    static let keyColor = Color("KeyColor")
    
    init(hex: String) {
        // Loại bỏ khoảng trắng và đổi chữ thường thành chữ hoa
        var hexFormatted = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        // Nếu có ký tự '#', bỏ qua nó
        if hexFormatted.hasPrefix("#") {
            hexFormatted.remove(at: hexFormatted.startIndex)
        }
        
        // Khởi tạo mặc định cho giá trị rgb
        var rgb: UInt64 = 0
        
        // Quét mã hex thành số
        Scanner(string: hexFormatted).scanHexInt64(&rgb)
        
        // Tách các thành phần màu đỏ, xanh lá, và xanh dương từ mã hex
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        
        // Khởi tạo `Color` với các giá trị màu
        self.init(red: red, green: green, blue: blue)
    }
}


