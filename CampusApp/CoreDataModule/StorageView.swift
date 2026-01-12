//
//  ContentView.swift
//  StorageEX
//
//  Created by itst on 18/11/2025.
//

import SwiftUI
import CoreData

struct StorageView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Device.timestamp, ascending: true)],
        animation: .default)
    private var devices: FetchedResults<Device>

    @State var showingSheet : Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(devices) { device in
                    NavigationLink {
                        StorageDetailView(device: device)
                    } label: {
                        Text("\(device.name!) - \(device.version!)")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showingSheet = true
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showingSheet, content: {
            AddDeviceView(showingSheet: $showingSheet)
        })
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { devices[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    StorageView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
