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
    
    enum CodingKeys: String, CodingKey{
        case content = "content"
        case answer = "answer"
    }
    
    init(content: String, answer: String = "") {
        self.content = content
        self.answer = answer
    }
}
