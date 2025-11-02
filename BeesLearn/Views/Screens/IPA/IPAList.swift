//
//  IPAList.swift
//  BeesLearn
//
//  Created by HoangDus on 1/11/25.
//

import SwiftUI

struct IPAList: View {
    @Environment(\.dismiss) var dismiss
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
    var body: some View {
        VStack{
            CustomNavigationBar(){
                dismiss()
            }
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    Section{
                        ForEach(0..<21, id: \.self) { index in
                            GridItemView(iPA: IPA(symbol: "\(index + 1)", exampleWord: "\(index + 1)", audio1Url: "\(index + 1)", audio2Url: "\(index + 1)"))
                        }
                    } header: {
                        HeaderView(text: "Nguyên Âm")
                    }
                    Section{
                        ForEach(21..<42, id: \.self) { index in
                            GridItemView(iPA: IPA(symbol: "\(index + 1)", exampleWord: "\(index + 1)", audio1Url: "\(index + 1)", audio2Url: "\(index + 1)"))
                        }
                    } header: {
                        HeaderView(text: "Phụ Âm")
                    }
                }
                .padding()
            }
        }        
        .background(Color("BackgroundColor"))
        .toolbar(.hidden, for: .navigationBar)
    }
}

struct HeaderView: View {
    let text: String
    var body: some View {
        VStack{
            Spacer()
            Text(text)
                .font(Font.custom("Nunito-Bold", size: 32))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 30)
    }
}

struct GridItemView: View {
    let iPA: IPA
    
    var body: some View {
        Button(action:{
            
        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("AppPrimaryColor"))
                    .shadow(color: Color("ShadowColor"), radius: 3, y: 3)
                VStack(spacing: 10){
                    Text("\(iPA.symbol)")
                        .foregroundColor(Color("AccentColor"))
                        .font(Font.custom("Nunito", size: 18))
                    Text("\(iPA.exampleWord)")
                        .foregroundColor(Color("AccentColor"))
                        .font(Font.custom("Nunito", size: 18))
                }
            }.frame(height: 80)
        })
    }
}

#Preview {
    IPAList()
}
