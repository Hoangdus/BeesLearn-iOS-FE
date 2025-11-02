//
//  IPA.swift
//  BeesLearn
//
//  Created by HoangDus on 2/11/25.
//

import Foundation

class IPA{
    var symbol: String
    var exampleWord: String
    var audio1Url: String
    var audio2Url: String
    
    init(symbol: String, exampleWord: String, audio1Url: String, audio2Url: String) {
        self.symbol = symbol
        self.exampleWord = exampleWord
        self.audio1Url = audio1Url
        self.audio2Url = audio2Url
    }
}
