//
//  FillInTheBlankViewModel.swift
//  BeesLearn
//
//  Created by HoangDus on 30/11/25.
//

import Foundation

final class FillInTheBlankViewModel: ObservableObject{
    @Published var question = "Điền vào chỗ trống"
    @Published var wordsInSentence: [Substring] = []
    @Published var vietnameseContext = ""
    @Published var answers: [String]
    @Published var selectedAnswer: String?
    @Published var selectedAnswerIndex: Int?
    
    private var blankedWordIndex: Int?
    
    init(question: FillInTheBlankQuestion){
        self.wordsInSentence = question.words
        self.vietnameseContext = question.vietnameseMeaning
        self.answers = question.possibleAnswers
        self.blankedWordIndex = self.wordsInSentence.firstIndex(of: "__________")
    }
    
    func selectAnswer(answer: String, index: Int){
        if(self.selectedAnswerIndex == index){
            self.selectedAnswerIndex = nil
            self.selectedAnswer = nil
            if(blankedWordIndex != nil){
                self.wordsInSentence[blankedWordIndex!] = "__________"
            }
            return
        }
        
        self.selectedAnswerIndex = index
        self.selectedAnswer = answer
        if(blankedWordIndex != nil){
            self.wordsInSentence[blankedWordIndex!] = Substring(stringLiteral: answer)
        }
    }
}
