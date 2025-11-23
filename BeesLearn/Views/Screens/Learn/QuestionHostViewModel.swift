//
//  QuestionHostViewModel.swift
//  BeesLearn
//
//  Created by HoangDus on 21/10/25.
//

import Foundation

enum QuestionResult{
    case correct
    case incorrect
}

final class QuestionHostViewModel: ObservableObject{
    @Published var progress: Double = 0.0
    @Published var nextQuestionID: UUID?
    @Published var dismissQuestionHostView = false
    @Published var result: QuestionResult?
    @Published var questions: [Question] = [
        MultipleChoiceQuestion(question: "Chọn nghĩa đúng", content: "Banana", answer: "Chuối", possiableAnswers: ["Chuoi1", "Chuoi2", "Chuoi3"]),
        MultipleChoiceQuestion(question: "Chọn nghĩa đúng", content: "Banana", answer: "Chuối", possiableAnswers: ["Chuoi1", "Chuoi2", "Chuoi3"]),
        MultipleChoiceQuestion(question: "Chọn nghĩa đúng", content: "Banana", answer: "Chuối", possiableAnswers: ["Chuoi1", "Chuoi2", "Chuoi3"]),
        TrueFalseQuestion(content: "is this a test?", tfAnswer: false)
    ]
    
    private var questionProgress = 0
    private var currentQuestion: Question?
    
    private var apiService = APIService.share
    
    init() {
        self.questions.shuffle()
        print("question list: \(questions)")
        self.currentQuestion = self.questions[questionProgress]
        apiService.getQuestions(complete: { result in
            switch result {
            case .success(let questionData):
                print(questionData)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func checkAnswer<T>(answer: T){
        if currentQuestion is TrueFalseQuestion{
            let trueFalseQuestion = currentQuestion as! TrueFalseQuestion
            if (trueFalseQuestion.checkAnswer(answer: answer as! Bool)){
                self.result = .correct
            }else{
                self.result = .incorrect
            }
        }else if currentQuestion is MultipleChoiceQuestion{
            let multipleChoiceQuestion = currentQuestion as! MultipleChoiceQuestion
            if (multipleChoiceQuestion.checkAnswer(answer: answer as! String)){
                self.result = .correct
            }else{
                self.result = .incorrect
            }
        }
        progress += 0.25
        
        
        print(self.result)
//        CompleteQuestion()
    }
    
    func CompleteQuestion(){
        if(progress == 1){
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.dismissQuestionHostView = true
//            })
            return
        }
        questionProgress += 1
        if(questionProgress < questions.count){
            nextQuestionID = questions[questionProgress].id
            currentQuestion = questions[questionProgress]
            result = nil
            print("next question id: \(nextQuestionID!)")
        }
    }
}
