//
//  QuestionHostView.swift
//  BeesLearn
//
//  Created by HoangDus on 2/10/25.
//

import SwiftUI

struct QuestionHostView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            CustomNavigationBar(){
                dismiss()
            }
            Spacer()
            MultipleChoices()
            Spacer()
        }
        .background(Color("BackgroundColor"))
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    QuestionHostView()
}
