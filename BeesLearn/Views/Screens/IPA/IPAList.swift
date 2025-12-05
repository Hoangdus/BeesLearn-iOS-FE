//
//  IPAList.swift
//  BeesLearn
//
//  Created by HoangDus on 1/11/25.
//

import SwiftUI

struct IPAList: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var iPAViewModel = IPAListViewModel()
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
                        ForEach(iPAViewModel.vowels) { ipa in
                            GridItemView(iPA: ipa){
                                iPAViewModel.playAudio(iPA: ipa)
                            }
                        }
                    } header: {
                        TitleText(text: "Nguyên Âm")
                    }
                    Section{
                        ForEach(iPAViewModel.consonants) { ipa in
                            GridItemView(iPA: ipa){
                                iPAViewModel.playAudio(iPA: ipa)
                            }
                        }
                    } header: {
                        TitleText(text: "Phụ Âm")
                    }
                }
                .padding()
            }
        }        
        .background(Color("BackgroundColor"))
        .toolbar(.hidden, for: .navigationBar)
    }
}

struct GridItemView: View {
    let iPA: IPA
    let action: ()->Void
    
    var body: some View {
        Button(action:{
            action()
        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("AppPrimaryColor"))
                    .shadow(color: Color("ShadowColor"), radius: 3, y: 3)
                VStack(spacing: 10){
                    Text("\(iPA.symbol)")
                        .foregroundColor(Color("AccentColor"))
                        .font(.system(size: 22))
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
