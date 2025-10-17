//
//  QuestionViewModel.swift
//  BeesLearn
//
//  Created by HoangDus on 15/10/25.
//

import Foundation

final class QuestionViewModel: ObservableObject{
    @Published var question = "Sắp xếp câu sau"
    @Published var sentence = "Lorem Ipsum is simply dummy text of the printing and typesetting. text"
    @Published var content = "Lorem Ipsum chỉ đơn giản là văn bản giả dùng cho việc in ấn và sắp chữ."
    
    @Published var wordsInSentence: [Substring] = []
    @Published var wordsInAnswer: [Substring] = []
    @Published var hiddenSentenceWords: [Int] = []
    
    init(){
        self.wordsInSentence = sentence.split(separator: " ").shuffled()
    }
    
    func putContentWordInAnswer(word: Substring, index: Int){
        self.wordsInAnswer.append(word)
        self.hiddenSentenceWords.append(index)
        print(hiddenSentenceWords)
    }
    
    func removeWordInAnswer(index: Int){
        self.wordsInAnswer.remove(at: index)
        self.hiddenSentenceWords.remove(at: index)
        print("after remove: \(hiddenSentenceWords)")
    }
}
