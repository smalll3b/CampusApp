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
            StorageView()
                .tabItem { Label("CoreData", systemImage: "archivebox") }
            
            BiometricView()
                .tabItem { Label("Biometric", systemImage: "faceid") }
            
            ContactView()
                .tabItem { Label("Web API", systemImage: "person.3") }
            
            LocationView()
                .tabItem { Label("Location", systemImage: "map") }
            
            SpeechView()
                .tabItem { Label("Speech", systemImage: "mic") }
            
            DeepseekView()
                .tabItem { Label("LLM", systemImage: "bubble.left.and.bubble.right") }
            
            MLView()
                .tabItem { Label("CoreML", systemImage: "camera") }
            
            TestExampleView()
                .tabItem { Label("Testing", systemImage: "checkmark.seal") }
            
            NavigationExampleView()
                .tabItem { Label("Navigation", systemImage: "list.bullet") }
            
            UIexampleView()
                .tabItem { Label("UIExamples", systemImage: "list.bullet") }
            
            PSSAppView()
                .tabItem { Label("PSSApp", systemImage: "list.bullet") }

        }
    }
}
