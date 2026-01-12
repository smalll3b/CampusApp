//
//  ContentView.swift
//  CampusApp
//
//  Created by smalll3b on 12/1/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SpotsView()
                .tabItem {
                    Image(systemName: "mappin.circle.fill")
                    Text("Spots")
                }.tag(0)

            SchoolView()
                .tabItem {
                    Image(systemName: "graduationcap.fill")
                    Text("My School")
                }.tag(1)

            MyLocationView()
                .tabItem {
                    Image(systemName: "globe")
                    Text("My Location")
                }.tag(2)
        }
    }
}

