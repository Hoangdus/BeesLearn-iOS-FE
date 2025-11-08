//
//  FlashCard.swift
//  BeesLearn
//
//  Created by HoangDus on 3/11/25.
//

import SwiftUI

struct FlashCard: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            CustomNavigationBar(goBack: {
                dismiss()
            })
            Spacer()
            Text("FlashCard placeholder")
            Spacer()
        }
        .background(Color("BackgroundColor"))
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    FlashCard()
}
