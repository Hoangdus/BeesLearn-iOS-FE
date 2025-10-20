//
//  QuestionHostViewModel.swift
//  BeesLearn
//
//  Created by HoangDus on 21/10/25.
//

import Foundation
import SwiftUI
import Combine

enum QuestionType: String{
    case TrueFalse
    case MultipleChoices
    case ArrangeWords
}

final class QuestionHostViewModel: ObservableObject{
    @Published var progress: Double = 0.0
    @Published var questionType: QuestionType?
    @Published var dismissQuestionHostView = false
    
    init() {
        let randomNumber = Int.random(in: 1...3)
        if(randomNumber == 1){
            questionType = QuestionType.TrueFalse
        }else if(randomNumber == 2){
            questionType = QuestionType.MultipleChoices
        }else{
            questionType = QuestionType.ArrangeWords
        }
        print("init question type: \(questionType!)")
    }
    
    func CompleteQuestion(){
        progress += 0.25
        let randomNumber = Int.random(in: 1...3)
        
        if(randomNumber == 1){
            questionType = QuestionType.TrueFalse
        }else if(randomNumber == 2){
            questionType = QuestionType.MultipleChoices
        }else{
            questionType = QuestionType.ArrangeWords
        }
        print("next question type: \(questionType!)")
        if(progress == 1){
            dismissQuestionHostView = true
        }
    }
}
