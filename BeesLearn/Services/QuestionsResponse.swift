//
//  QuestionsResponse.swift
//  BeesLearn
//
//  Created by HoangDus on 22/11/25.
//

import Foundation

struct QuestionsResponse: Decodable{
    var trueFalseQuestions: [Question]
    var words: [Word]
    var sentences: [Sentence]
}
