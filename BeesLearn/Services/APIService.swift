//
//  APIService.swift
//  BeesLearn
//
//  Created by HoangDus on 21/11/25.
//

import Foundation

enum APIError: Error{
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}

final class APIService{
    static let share = APIService()
    
    private let baseURL = URL(string: "http://127.0.0.1:8080/")
    
    func getQuestionsData(complete: @escaping (Result<QuestionsResponse, APIError>) -> Void){
        let endpoint = baseURL?.appending(path: "questions").appending(queryItems: [URLQueryItem(name: "total", value: "10")])
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: endpoint!)){ data,response,error in
            if let _ = error{
                complete(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                complete(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                complete(.failure(.invalidData))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(QuestionsResponse.self, from: data)
                complete(.success(decodedResponse))
            } catch {
                complete(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
