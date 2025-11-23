//
//  TrueFalseQuestion.swift
//  BeesLearn
//
//  Created by HoangDus on 23/10/25.
//

import Foundation

final class TrueFalseQuestion: Question{
    
    func checkAnswer(answer: String) -> Bool{
        return answer == self.answer
    }
    
}
