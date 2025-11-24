//
//  ProgressNavigationBar.swift
//  BeesLearn
//
//  Created by HoangDus on 21/10/25.
//


import SwiftUI

struct ProgressNavigationBar: View {
    var progress: Double
    var goBack: ()->Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 30){
            Button(action: {
                goBack()
            }, label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 34)
                    .tint(Color("ButtonColor"))
            })
            ProgressView(value: progress)
                .tint(Color("ButtonColor"))
            Spacer()
        }
        .frame(height: 45)
        .padding(.horizontal)

    }
}
