//
//  FillInTheBlankViewModel.swift
//  BeesLearn
//
//  Created by HoangDus on 30/11/25.
//

import Foundation

final class FillInTheBlankViewModel: ObservableObject{
    @Published var sentence = "Lorem Ipsum is simply dummy text of the printing and typesetting. text"
    @Published var wordsInSentence: [Substring] = []
    
    init(){
        self.wordsInSentence = sentence.split(separator: " ")
        self.wordsInSentence[Int.random(in: 0...self.wordsInSentence.count-1)] = "_________"
    }
}
