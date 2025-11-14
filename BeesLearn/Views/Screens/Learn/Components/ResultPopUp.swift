//
//  ResultPopUp.swift
//  BeesLearn
//
//  Created by HoangDus on 13/11/25.
//

import SwiftUI

struct ResultPopUp: View {
    var correctness: QuestionResult
    var action: ()->Void
    
    var body: some View {
        Rectangle()
            .fill(correctness == .correct ? Color("Sea Foam Green") : Color("Pale Pink"))
            .frame(height: 150)
            .overlay(content: {
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: correctness == .correct ? "checkmark.circle.fill" : "x.circle.fill")
                            .foregroundStyle(correctness == .correct ? Color.green : Color.red)
                            .font(.system(size: 30))
                        Text(correctness == .correct ? "Correct" : "Incorrect")
                            .font(Font.custom("Nunito-Bold", size: 30))
                            .foregroundStyle(correctness == .correct ? Color.green : Color.red)
                    }
                    Button(action: {
                        action()
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(correctness == .correct ? Color.green : Color.red)
                            .overlay(content: {
                                Text("Next")
                                    .font(Font.custom("Nunito-Bold", size: 21))
                                    .foregroundStyle(Color.white)
                            })
                    })
                }.padding()
            })
    }
}

#Preview {
    ResultPopUp(correctness: .correct){}
}
