//
//  ContentView.swift
//  CampusApp
//
//  Created by smalll3b on 4/1/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            BiometricView()
                .tabItem { Label("Biometric", systemImage: "faceid") }
            
            StorageView()
                .tabItem { Label("CoreData", systemImage: "archivebox") }
            
            LocationView()
                .tabItem { Label("Location", systemImage: "map") }
        
            DeepseekView()
                .tabItem { Label("LLM", systemImage: "bubble.left.and.bubble.right") }
            
            MLView(classifier: ImageClassifier())
                .tabItem { Label("SeeFoodML", systemImage: "camera") }
            
            PneumoniaView(classifier: ImageClassifier1())
                .tabItem { Label("PneumoniaML", systemImage: "camera") }
            
            NavigationExampleView()
                .tabItem { Label("Navigation", systemImage: "list.bullet") }
            
            UIexampleView()
                .tabItem { Label("UIExamples", systemImage: "list.bullet") }
            
            PSSAppView()
                .tabItem { Label("PSSApp", systemImage: "list.bullet") }
            
            SpeechView()
                .tabItem { Label("Speech", systemImage: "mic") }
            
            TestExampleView()
                .tabItem { Label("Testing", systemImage: "checkmark.seal") }
        }
    }
}
