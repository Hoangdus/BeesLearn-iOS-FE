//
//  ArrangeWordsViewModel.swift
//  BeesLearn
//
//  Created by HoangDus on 30/11/25.
//

import Foundation

final class ArrangeWordsViewModel: ObservableObject{
    @Published var sentence = "Lorem Ipsum is simply dummy text of the printing and typesetting. text"
    @Published var vietnameseContext = ""
    @Published var question = "Sắp xếp câu sau"
    @Published var wordsInSentence: [Substring] = []
    @Published var wordsInAnswer: [Substring] = []
    @Published var hiddenSentenceWords: [Int] = []
    
    init(question: ArrangeQuestion){
        self.sentence = question.content
        self.vietnameseContext = question.vietnameseMeaning
        self.wordsInSentence = sentence.split(separator: " ").shuffled()
    }
    
    func putContentWordInAnswer(word: Substring, index: Int){
        self.wordsInAnswer.append(word)
        self.hiddenSentenceWords.append(index)
//        print(hiddenSentenceWords)
    }
    
    func removeWordInAnswer(index: Int){
        self.wordsInAnswer.remove(at: index)
        self.hiddenSentenceWords.remove(at: index)
//        print("after remove: \(hiddenSentenceWords)")
    }
    
    func getAnswer() -> String{
        return wordsInAnswer.joined(separator: " ")
    }
}
