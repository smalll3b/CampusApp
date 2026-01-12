//
//  NavigationExampleView.swift
//  CampusApp
//
//  Created by smalll3b on 5/1/2026.
//

import SwiftUI
import Combine

struct NavigationExampleView: View {
    let artworks = artData
    var body: some View {
        NavigationView {
            List(artworks) {
                artwork in
                NavigationLink( destination: DetailView(artwork: artwork)) {
                    Text(artwork.title)
                }
            }.navigationTitle("Disciplines")
        }
    }
}

#Preview {
    NavigationExampleView()
}
