//
//  QuestionRepository.swift
//  BeesLearn
//
//  Created by HoangDus on 23/11/25.
//

import Foundation

final class QuestionRepository{
    static let shared = QuestionRepository()
    
    func getQuestions(complete: @escaping (Result<[Question], APIError>) -> Void){
        let apiservice = APIService.share
        
        apiservice.getQuestionsData(complete: { result in
            switch result {
            case .success(let response):
                var questions: [Question] = []
//                for question in response.trueFalseQuestions{
//                    questions.append(question)
//                }
                
                questions.append(contentsOf: response.trueFalseQuestions)
                
                let shuffledWords = response.words.shuffled()
                questions.append(MultipleChoiceQuestion(question: "Chọn nghĩa đúng", content: shuffledWords[0].englishWord, answer: shuffledWords[0].vietnameseMeaning, possiableAnswers: [shuffledWords[1].vietnameseMeaning, shuffledWords[2].vietnameseMeaning ,shuffledWords[3].vietnameseMeaning], vietnameseMeaning: ""))
                questions.append(MultipleChoiceQuestion(question: "Chọn nghĩa đúng", content: shuffledWords[4].englishWord, answer: shuffledWords[4].vietnameseMeaning, possiableAnswers: [shuffledWords[5].vietnameseMeaning, shuffledWords[6].vietnameseMeaning ,shuffledWords[7].vietnameseMeaning], vietnameseMeaning: ""))
                
                for sentence in response.sentences{
                    if(Int.random(in: 1...2) == 1){
                        questions.append(ArrangeQuestion(content: sentence.content, answer: sentence.content, vietnameseMeaning: sentence.meaning))
                    }else{
                        questions.append(FillInTheBlankQuestion(content: sentence.content, vietnameseMeaning: sentence.meaning, possibleAnswers: [shuffledWords[Int.random(in: 0...3)].englishWord, shuffledWords[Int.random(in: 4...7)].englishWord]))
                    }
                }
                
                complete(.success(questions))
            case .failure(let error):
                complete(.failure(error))
            }
        })
    }
}
