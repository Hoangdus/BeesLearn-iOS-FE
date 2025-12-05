//
//  CustomNavigationBar.swift
//  BeesLearn
//
//  Created by HoangDus on 2/10/25.
//

import SwiftUI

struct CustomNavigationBar: View {
    var title: String
    var goBack: ()->Void
    
    var body: some View {
        HStack(alignment: .center){
            Button(action: {
                goBack()
            }, label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 34)
                    .tint(Color("ButtonColor"))
            })
            if(!title.isEmpty){
                Spacer()
                Text(title)
                    .font(Font.custom("Nunito-Bold", size: 24))
                    .foregroundStyle(Color("ButtonColor"))
            }
            Spacer()
            Image(systemName: "chevron.left")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 34)
                .tint(Color("ButtonColor"))
                .opacity(0)
        }
        .frame(height: 45)
        .padding(.horizontal)

    }
}

#Preview {
    CustomNavigationBar(title: "test" ,goBack: {})
}
