//
//  QuizQuestion.swift
//  DSeekApp
//
//  Created by itst on 25/11/2025.
//

import SwiftUI
import Foundation

// MARK: - Data Models
struct QuizQuestion: Codable, Identifiable {
    var id = UUID()
    let question: String
    let choices: [String]
    let correctAnswer: String
    enum CodingKeys: String, CodingKey {
        case question
        case choices
        case correctAnswer = "correct_answer"
    }
}
