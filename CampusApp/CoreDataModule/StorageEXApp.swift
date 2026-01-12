//
//  StorageEXApp.swift
//  StorageEX
//
//  Created by itst on 18/11/2025.
//

import SwiftUI
import CoreData

struct StorageEXApp: View {
    let persistenceController = PersistenceController.shared

    var body: some View {
            StorageView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
