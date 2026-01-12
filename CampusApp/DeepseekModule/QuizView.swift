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
                    // Quiz completed screen.
                    // Task: Display the end game UI
                } else {
                    // Show current question.
                    if let question = quizManager.currentQuestion {
                        VStack(spacing: 20) {
                            Text("Question \(quizManager.currentIndex + 1) of \(quizManager.totalQuestions)")
                                .font(.headline)
                            Text(question.question)
                                .font(.title2)
                                .multilineTextAlignment(.center)
                            // Displaying the answer choices.
                            ForEach(question.choices, id: \.self) { choice in
                                Button(action: {
                                    quizManager.checkAnswer(choice)
                                }) {
                                    HStack {
                                        Text(choice)
                                            .foregroundColor(.primary)
                                        Spacer()
                                        // Show feedback icon after an answer is selected.
                                        if quizManager.answered {
                                            if choice == question.correctAnswer {
                                                Image(systemName: "checkmark.circle")
                                                    .foregroundColor(.green)
                                            } else if choice ==
                                                        quizManager.selectedAnswer {
                                                Image(systemName: "x.circle")
                                                    .foregroundColor(.red)
                                            }
                                        }
                                    }.padding()
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(8)
                                }
                                .disabled(quizManager.answered)
                            }
                            // 'Next' button appears after answering a question.
                            if quizManager.answered {
                                // Task: Create a next Button and it will all quizManager.next()
                            }
                        }.padding()
                    } else {
                        // Loading state.
                        ProgressView("Loading Question...")
                            .onAppear {
                                quizManager.resetQuiz()
                            }
                    }
                }
            }
            // Task: set navigation title to: "Countries & Cities Quiz"
        }
    }
}

#Preview {
    QuizView()
}
