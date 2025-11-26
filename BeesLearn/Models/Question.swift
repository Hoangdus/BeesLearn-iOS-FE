//
//  Question.swift
//  BeesLearn
//
//  Created by HoangDus on 23/10/25.
//

import Foundation

class Question: Identifiable, Decodable{
    var id = UUID()
    var content: String
    var answer: String
    var vietnameseMeaning: String
    
    enum CodingKeys: String, CodingKey{
        case content = "content"
        case answer = "answer"
        case vietnameseMeaning = "vietnameseMeaning"
    }
    
    init(content: String, answer: String, vietnameseMeaning: String) {
        self.content = content
        self.answer = answer
        self.vietnameseMeaning = vietnameseMeaning
    }
}
