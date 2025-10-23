//
//  QuestionHostViewModel.swift
//  BeesLearn
//
//  Created by HoangDus on 21/10/25.
//

import Foundation

final class QuestionHostViewModel: ObservableObject{
    @Published var progress: Double = 0.0
    @Published var nextQuestionID: UUID?
    @Published var dismissQuestionHostView = false
    @Published var questions: [Question] = [
        Question(content: "test1", answer: "test2"),
        Question(content: "test1", answer: "test2"),
        Question(content: "test1", answer: "test2"),
        TrueFalseQuestion(content: "test", tfAnswer: false)
    ]
    
    private var questionProgress = 0
    
    
    init() {
        self.questions.shuffle()
        print("question list: \(questions)")
    }
    
    func CompleteQuestion(){
        progress += 0.25
        
        questionProgress += 1
        if(questionProgress < questions.count){
            nextQuestionID = questions[questionProgress].id
            print("next question id: \(nextQuestionID!)")
        }
        
        if(progress == 1){
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.dismissQuestionHostView = true
            })
        }
    }
}
