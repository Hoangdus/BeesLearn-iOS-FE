//
//  TrueFalseQuestion.swift
//  BeesLearn
//
//  Created by HoangDus on 23/10/25.
//

import Foundation

final class TrueFalseQuestion: Question{
    var tfAnswer: Bool
    
    init(content: String, tfAnswer: Bool) {
        self.tfAnswer = tfAnswer
        super.init(content: content)
    }
}
