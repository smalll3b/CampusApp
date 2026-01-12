//
//  AddDeviceView.swift
//  StorageEX
//
//  Created by itst on 18/11/2025.
//

import SwiftUI

struct AddDeviceView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Binding var showingSheet : Bool
    
    @State var name : String = ""
    @State var version : String = ""
    @State var company : String = ""
    
    var body: some View {
        VStack {
            Text("Create a new Device").padding()
            TextField("Name", text: $name)
                .padding()
            TextField("Version", text: $version)
                .padding()
            TextField("Company", text: $company)
                .padding()
            HStack {
                Button(action: {
                    createDevice()
                }, label: {
                    Text("Save")
                })
                Button(action: {
                    showingSheet = false
                }, label: {
                    Text("Cancel")
                })
            }
            Spacer()
        }
    }
    
    func createDevice() {
        let device = Device(context: viewContext)
        device.name = name
        device.company = company
        device.version = version
        device.timestamp = Date()
        try? viewContext.save()
        self.name = ""
        self.version = ""
        self.company = ""
        showingSheet = false
    }
}

