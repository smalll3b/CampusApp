//
//  QuizAPI.swift
//  DSeekApp
//
//  Created by itst on 25/11/2025.
//

import SwiftUI
import Foundation
import Combine

// MARK: - API Client Using Deepseek's JSON Output
class QuizAPI {
    private let apiKey = "sk-ca7d074b92e94da58b7a0090f8b2309b" // Replace with your Deepseek API key.
    private let baseURL = "https://api.deepseek.com" // Replace with the actual API endpoint.
    let json = """
{
"question": "What is the capital of France?",
"choices": ["London", "Berlin", "Rome", "Paris"],
"correct_answer": "Paris"
}
"""
    /// Fetches a quiz question from the Deepseek API.
    func fetchQuizQuestion(completion: @escaping (Result<[QuizQuestion], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/chat/completions") else {
            completion(.failure(NSError(domain: "InvalidURL", code: -1, userInfo: nil)))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST" // Use GET or POST according to the API specification.
        request.addValue("Bearer \(apiKey)"
                         , forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonBody: [String : Any] = ["model": "deepseek-chat",
                                        "messages": [
                                            ["role" : "user",
                                             "content" : "Based on the format, generate 10 question related to cities in the world \" \(json) \", give json array output only"]
                                        ],
                                        "stream": false]
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: jsonBody, options: [])
        } catch {
            completion(.failure(error))
            return
        }
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "NoData", code: -1, userInfo: nil)))
                return
            }
            do {
                //print("data: \(String(data: data, encoding: .utf8))")
                let chatResponse = try JSONDecoder().decode(ChatResponse.self, from: data)
                let content = chatResponse.choices?.first?.message?.content ?? ""
                let jsonStr = content.replacingOccurrences(of: "```json", with: "").replacingOccurrences(of:
                                                                                                            "```"
                                                                                                         , with: "")
                //print("\(content)")
                let quizQuestion = try JSONDecoder().decode([QuizQuestion].self, from:
                                                                jsonStr.data(using: .utf8)!)
                completion(.success(quizQuestion))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
