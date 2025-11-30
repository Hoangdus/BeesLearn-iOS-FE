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
    @Published var questions: [Question] = []
    
    private var questionProgress = 0
    private var currentQuestion: Question?
    
    private var questionRepository = QuestionRepository.shared
    
    init() {
        self.questionRepository.getQuestions(complete: { result in
            DispatchQueue.main.async(execute: {
                switch result {
                case .success(let questionData):
                    self.questions = questionData
                    self.questions.shuffle()
                    self.currentQuestion = self.questions[self.questionProgress]
                    print(self.questions)
                case .failure(let error):
                    print(error)
                }
            })
        })
    }
    
    func checkAnswer<T>(answer: T){
        if currentQuestion is TrueFalseQuestion{
            let trueFalseQuestion = currentQuestion as! TrueFalseQuestion
            if (trueFalseQuestion.checkAnswer(answer: answer as! String)){
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
        }else if currentQuestion is ArrangeQuestion{
            let arrangeQuestion = currentQuestion as! ArrangeQuestion
            if (arrangeQuestion.checkAnswer(answer: answer as! String)){
                self.result = .correct
            }else{
                self.result = .incorrect
            }
        }else if currentQuestion is FillInTheBlankQuestion{
            let fillInTheBlankQuestion = currentQuestion as! FillInTheBlankQuestion
            if (fillInTheBlankQuestion.checkAnswer(answer: answer as! String)){
                self.result = .correct
            }else{
                self.result = .incorrect
            }
        }
        progress += 1 / Double(self.questions.count)
        
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
