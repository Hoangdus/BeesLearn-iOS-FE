//
//  CustomNavigationBar.swift
//  BeesLearn
//
//  Created by HoangDus on 2/10/25.
//

import SwiftUI

struct CustomNavigationBar: View {
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
            })
            Spacer()
        }
        .frame(height: 45)
        .padding(.horizontal)

    }
}

#Preview {
    CustomNavigationBar(goBack: {})
}
