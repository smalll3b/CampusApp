//
//  DeepseekView.swift
//  CampusApp
//
//  Created by smalll3b on 5/1/2026.
//

import SwiftUI

struct DeepseekView: View {
    var body: some View {
        TabView {
            DailyConciergeView()
                .tabItem { Label("Chat", systemImage: "bubble.left.and.bubble.right") }
            QuizView()
                .tabItem { Label("Quiz", systemImage: "questionmark.app") }
        }
    }
}
