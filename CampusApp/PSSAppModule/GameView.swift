//
//  GameView.swift
//  PSSApp
//
//  Created by itst on 14/10/2025.
//
import SwiftUI
struct GameView : View {
    @Binding var isShowGame : Bool
    @State var userInput  = "✊"
    @State var computerInput = "✊"
    @State var statusText = "Please Input \"✌\", \"✊\" and \"✋\" emoji."
    var body: some View {
        VStack {
            
            Text("Computer")
            Spacer()
            Text(computerInput)
                .font(.system(size: 150))
            Spacer()
            Text(statusText)
            Spacer()
            Text(userInput)
                .font(.system(size: 150))
            Text("User")
            Spacer()
            HStack {
                InputView(userInput: $userInput, computerInput: $computerInput, statusText: $statusText)
                Spacer()
                Button(action: {
                    withAnimation {
                        isShowGame.toggle()
                    }
                }) {
                    Text("Back")
                }.buttonStyle(.bordered)
            }
        }
        .padding()
    }
}

#Preview {
    
    GameView(isShowGame: .constant(true))
}
