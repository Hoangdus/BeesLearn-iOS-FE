//
//  FillInTheBlankQuestion.swift
//  BeesLearn
//
//  Created by HoangDus on 1/12/25.
//

import Foundation

final class FillInTheBlankQuestion: Question{
    var words: [Substring]
    var possibleAnswers: [String]
    
    init(content: String, vietnameseMeaning: String, possibleAnswers: [String]) {
        self.possibleAnswers = []
        self.words = content.split(separator: " ")
        let randomIndex = Int.random(in: 0...self.words.count-1)
        let answer = self.words[randomIndex]
        self.words[randomIndex] = "__________"
        
        let isAnswerIsFirstWord = answer.first!.isUppercase
        if(!isAnswerIsFirstWord){
            for answer in possibleAnswers{
                self.possibleAnswers.append(answer.description.lowercased())
            }
        }else{
            self.possibleAnswers = possibleAnswers
        }
        self.possibleAnswers.append(answer.description)
        self.possibleAnswers.shuffle()
        super.init(content: content, answer: answer.description, vietnameseMeaning: vietnameseMeaning)
    }
    
    required init(from decoder: any Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    func checkAnswer(answer: String) -> Bool {
        return self.answer == answer
    }
}
