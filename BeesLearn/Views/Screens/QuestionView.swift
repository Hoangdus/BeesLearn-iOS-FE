//
//  QuestionView.swift
//  BeesLearn
//
//  Created by HoangDus on 2/10/25.
//

import SwiftUI

struct QuestionView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            CustomNavigationBar(){
                dismiss()
            }
            Spacer()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Spacer()
        }
        .background(Color("BackgroundColor"))
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    QuestionView()
}
