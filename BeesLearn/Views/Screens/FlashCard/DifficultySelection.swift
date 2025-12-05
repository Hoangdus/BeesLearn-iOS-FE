//
//  DifficultySelection.swift
//  BeesLearn
//
//  Created by HoangDus on 5/12/25.
//

import SwiftUI

struct DifficultySelection: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            CustomNavigationBar(title: "", goBack: {
                dismiss()
            })
            Spacer()
            VStack(spacing: 30){
                TitleText(text: "Chọn độ khó")
                DifficultyButton()
                    .frame(height: 100)
                DifficultyButton()
                    .frame(height: 100)
                DifficultyButton()
                    .frame(height: 100)
            }
            .padding(60)
            Spacer()
        }
        .background(Color("BackgroundColor"))
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    DifficultySelection()
}
