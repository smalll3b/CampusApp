//
//  CampusAppApp.swift
//  CampusApp
//
//  Created by smalll3b on 4/1/2026.
//

import SwiftUI
import CoreData

@main
struct CampusAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

