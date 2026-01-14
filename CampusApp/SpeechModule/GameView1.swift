//
//  GameView.swift
//  CampusApp
//
//  Created by smalll3b on 15/1/2026.
//

import SwiftUI
import Combine

struct GameView: View {
    @StateObject private var speechRecognizer = SpeechRecognizer()
    @State private var message: String = "Say 'left', 'right', 'up' or 'down'"
    @State private var playerPositionX: CGFloat = 0.0
    @State private var playerPositionY: CGFloat = 0.0

    var body: some View {
        VStack {
            Text("Voice-Controlled Game")
                .font(.largeTitle)
                .padding()

            Text(message)
                .padding()
                .foregroundColor(.blue)

            HStack {
                Spacer()
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)
                    .offset(x: playerPositionX, y: playerPositionY)
                Spacer()
            }
            .padding()

            Button(action: {
                if self.speechRecognizer.audioEngine.isRunning {
                    self.speechRecognizer.stopListening()
                    self.message = "Stopped listening."
                } else {
                    self.speechRecognizer.startListening()
                    self.message = "Listening ..."
                }
            }) {
                Text(self.speechRecognizer.audioEngine.isRunning ? "Stop Listening" : "Start Listening")
                    .foregroundColor(.white)
                    .padding()
                    .background(self.speechRecognizer.audioEngine.isRunning ? Color.red : Color.green)
                    .cornerRadius(10)
            }
        }
        .onChange(of: speechRecognizer.recognizedText) { newText in
            handleVoiceCommand(newText)
        }
    }

    private func handleVoiceCommand(_ command: String) {
        print("\(command)")
        let lower = command.lowercased()

        if lower.hasSuffix("left") || lower.hasSuffix("左") {
            withAnimation { playerPositionX -= 20 }
            message = "Moved Left!"
        } else if lower.hasSuffix("right") || lower.hasSuffix("右") {
            withAnimation { playerPositionX += 20 }
            message = "Moved Right!"
        } else if lower.hasSuffix("up") || lower.hasSuffix("上") {
            withAnimation { playerPositionY -= 20 }
            message = "Moved Up!"
        } else if lower.hasSuffix("down") || lower.hasSuffix("下") {
            withAnimation { playerPositionY += 20 }
            message = "Moved Down!"
        } else {
            message = "Unknown command: \(command)"
        }
    }
}
