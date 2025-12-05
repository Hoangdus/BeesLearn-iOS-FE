//
//  TopicList.swift
//  BeesLearn
//
//  Created by HoangDus on 5/12/25.
//

import SwiftUI

struct TopicList: View {
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView{
            TitleText(text: "Chọn 1 chủ đề")
                .padding()
            NavigationLink(
                destination: DifficultySelection()
            ){
                TopicItem()
                    .padding(.horizontal)
                    .frame(height: 100)
            }
            
            LazyVGrid(columns: columns, spacing: 20){
                ForEach(0..<100){ i in
                    NavigationLink(
                        destination: DifficultySelection()
                    ){
                        TopicItem()
                        .frame(height: 100)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    TopicList()
}
