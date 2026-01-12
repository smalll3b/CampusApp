//
//  DailyConciergeView.swift
//  DSeekApp
//
//  Created by itst on 25/11/2025.
//

import Foundation
import SwiftUI

struct DailyConciergeView : View {
    @State private var userInput: String = ""
    @State private var chatHistory: [String] = []
    let conciergeAPI = DailyConciergeAPI()
    var body: some View {
        NavigationView {
            VStack {
                // Display chat history.
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(chatHistory, id: \.self) { message in
                            Text(message)
                                .padding(8)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(8)
                                .frame(maxWidth: .infinity, alignment:
                                        message.hasPrefix("You:") ? .trailing : .leading)
                        }
                    }
                    .padding()
                }
                .frame(maxHeight: 300)
                // Input field and button for chat.
                // TASK: Construct the the Chat Input shown as below
                HStack {
                    TextField(text: $userInput, label: {Text("Enter your name")})
                        .textFieldStyle(.roundedBorder)
                    Button(action: { sendChat() }, label: { Text("Send")})
                }
            }
            .navigationTitle("Smart Daily Concierge")
        }
    }
    // Sends user input to the Deepseek chat API.
    func sendChat() {
        let message = userInput
        chatHistory.append("You: \(message)")
        userInput = ""
        conciergeAPI.chat(with: message) { result in
            switch result {
            case .success(let chatResponse):
                DispatchQueue.main.async {
                    chatHistory.append("Assistant: \(chatResponse.choices?.first?.message?.content ?? "No Reply")")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    chatHistory.append("Error: \(error.localizedDescription)")
                }
            }
        }
        
    }
}

#Preview {
    DailyConciergeView()
}
