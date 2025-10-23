//
//  Question.swift
//  BeesLearn
//
//  Created by HoangDus on 23/10/25.
//

import Foundation

class Question: Identifiable{
    var id = UUID()
    var content: String
    var answer: String
    
    init(content: String, answer: String = "") {
        self.content = content
        self.answer = answer
    }
}
