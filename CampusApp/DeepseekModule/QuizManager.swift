//
//  QuizManager.swift
//  DSeekApp
//
//  Created by itst on 25/11/2025.
//
import Foundation

class QuizManager: ObservableObject {
    @Published var currentQuestions: [QuizQuestion]?
    @Published var currentIndex: Int = 0
    @Published var score: Int = 0
    @Published var showResult: Bool = false
    @Published var answered: Bool = false
    @Published var selectedAnswer: String? = nil
    var currentQuestion : QuizQuestion? {
        guard let currentQuestions else {
            return nil
        }
        return currentQuestions[currentIndex]
    }
    // Total number of quiz questions.
    let totalQuestions: Int = 10
    private let quizAPI = QuizAPI()
    /// Loads the next quiz question if available, otherwise ends the quiz.
    func loadQuestion() {
        if currentIndex < totalQuestions {
            answered = false
            quizAPI.fetchQuizQuestion { [weak self] result in
                switch result {
                case .success(let question):
                    DispatchQueue.main.async {
                        self?.currentQuestions = question
                    }
                case .failure(let error):
                    print("Error loading question: \(error.localizedDescription)")
                }
            }
        } else {
            DispatchQueue.main.async {
                self.showResult = true
            }
        }
    }
    func loadNextQuestion() {
        if currentIndex < totalQuestions {
            answered = false
        } else {
            DispatchQueue.main.async {
                self.showResult = true
            }
        }
    }
    /// Checks the user-selected answer and updates the score.
    func checkAnswer(
        _
        answer: String) {
            guard let currentQuestion = currentQuestion, !answered else { return }
            selectedAnswer = answer
            answered = true
            if answer == currentQuestion.correctAnswer {
                score += 1
            }
        }
    /// Moves to the next question.
    func next() {
        guard let currentQuestions else {
            return
        }
        if currentIndex == (currentQuestions.count - 1) {
            showResult = true
            return
        }
        currentIndex += 1
        loadNextQuestion()
    }
    /// Resets the quiz to its initial state.
    func resetQuiz() {
        currentIndex = 0
        score = 0
        showResult = false
        loadQuestion()
    }
}
