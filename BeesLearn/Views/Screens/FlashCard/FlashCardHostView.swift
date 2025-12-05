//
//  FlashCardHostView.swift
//  BeesLearn
//
//  Created by HoangDus on 3/11/25.
//

import SwiftUI

struct FlashCardHostView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            CustomNavigationBar(title: "Flashcards", goBack: {
                dismiss()
            })
            TopicList()
        }
        .background(Color("BackgroundColor"))
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    FlashCardHostView()
}
