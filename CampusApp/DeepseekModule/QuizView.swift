//
//  QuizView.swift
//  DSeekApp
//
//  Created by itst on 25/11/2025.
//

import SwiftUI

struct QuizView: View {
    @StateObject private var quizManager = QuizManager()

    var body: some View {
        NavigationView {
            VStack {
                if quizManager.showResult {
                    // Quiz completed screen
                    VStack(spacing: 20) {
                        Text("Quiz Completed!")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text("Your Score: \(quizManager.score) / \(quizManager.totalQuestions)")
                            .font(.title2)

                        Button("Restart Quiz") {
                            quizManager.resetQuiz()
                        }
                        .padding()
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(8)
                    }
                } else {
                    // Show current question
                    if let question = quizManager.currentQuestion {
                        VStack(spacing: 20) {
                            Text("Question \(quizManager.currentIndex + 1) of \(quizManager.totalQuestions)")
                                .font(.headline)

                            Text(question.question)
                                .font(.title2)
                                .multilineTextAlignment(.center)

                            // Displaying the answer choices
                            ForEach(question.choices, id: \.self) { choice in
                                Button(action: {
                                    quizManager.checkAnswer(choice)
                                }) {
                                    HStack {
                                        Text(choice)
                                            .foregroundColor(.primary)
                                        Spacer()
                                        if quizManager.answered {
                                            if choice == question.correctAnswer {
                                                Image(systemName: "checkmark.circle")
                                                    .foregroundColor(.green)
                                            } else if choice == quizManager.selectedAnswer {
                                                Image(systemName: "x.circle")
                                                    .foregroundColor(.red)
                                            }
                                        }
                                    }
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                                }
                                .disabled(quizManager.answered)
                            }

                            // 'Next' button appears after answering a question
                            if quizManager.answered {
                                Button("Next") {
                                    quizManager.next()
                                }
                                .padding()
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(8)
                            }
                        }
                        .padding()
                    } else {
                        // Loading state
                        ProgressView("Loading Question...")
                            .onAppear {
                                quizManager.resetQuiz()
                            }
                    }
                }
            }
            .navigationTitle("Countries & Cities Quiz")
        }
    }
}
