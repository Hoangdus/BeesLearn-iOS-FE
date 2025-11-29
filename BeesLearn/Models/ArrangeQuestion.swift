//
//  ArrangeQuestion.swift
//  BeesLearn
//
//  Created by HoangDus on 26/11/25.
//

import Foundation

final class ArrangeQuestion: Question{
    
    func checkAnswer(answer: String) -> Bool{
        return self.answer == answer
    }
}
