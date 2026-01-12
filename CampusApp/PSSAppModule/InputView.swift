//
//  InputView.swift
//  PSSApp
//
//  Created by itst on 14/10/2025.
//

import SwiftUI

struct InputView : View {
    @Binding var userInput : String
    @Binding var computerInput : String
    @Binding var statusText : String
    var body : some View {
        HStack {
            Spacer()
            ForEach(array, id:\.self) {
                txt in
                Button(action: {
                    gamePlay(txt)
                }) {
                    Text(txt)
                }.buttonStyle(.borderedProminent)
            }
            Spacer()
        }
    }
    
    func gamePlay(_ userInput : String) {
        self.userInput = userInput
        let randNo = Int.random(in: 0...2)
        if randNo == 0 {
            computerInput = "✌"
        } else if randNo == 1 {
            computerInput = "✊"
        } else {
            computerInput = "✋"
        }
        if computerInput == userInput {
            statusText = "draw"
        } else if (userInput == "✋" && computerInput == "✊" ) ||
                  (userInput == "✊" && computerInput == "✌") ||
                  (userInput == "✌" && computerInput == "✋") {
            statusText = "user wins"
        } else {
            statusText = "computer wins"
        }
    }
}
