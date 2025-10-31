//
//  MultipleChoiceQuestion.swift
//  BeesLearn
//
//  Created by HoangDus on 25/10/25.
//

import Foundation

final class MultipleChoiceQuestion: Question{
    var question: String
    var possibleAnswers: [String]
    
    init(question: String, content: String, answer: String, possiableAnswers: [String]) {
        self.question = question
        self.possibleAnswers = possiableAnswers
        self.possibleAnswers.append(answer)
        self.possibleAnswers.shuffle()
        super.init(content: content, answer: answer)
    }
    
    func checkAnswer(answer: String) -> Bool{
        return answer == self.answer
    }
}
