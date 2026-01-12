//
//  UIexampleView.swift
//  CampusApp
//
//  Created by smalll3b on 6/1/2026.
//

import SwiftUI
import Combine

struct Entry : Identifiable{
    var id : Int
    var text = "abc"
}

struct UIexampleView: View {
    @State var number = 0;
    @State var isShowModal = false
    
    @State var entries = [Entry(id: 0), Entry(id: 1), Entry(id: 2), Entry(id: 3)]
    
    var body: some View {
        VStack {
            
            if number % 2 == 0 {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                }.transition(.scale)
            } else {
                VStack {
                    Image(systemName: "star")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, universe!")
                }.transition(.scale)
            }
            
            Button(action: {
                isShowModal.toggle()
            }, label: {
                Text("+")
                    .buttonStyle(.bordered)
            })
            .alert(isPresented: $isShowModal, content: {
                Alert(title: Text("Hi"), primaryButton: .default(Text("Cancel")), secondaryButton: .default(Text("Action"), action: {
                    
                }))
            })
            
            //ScrollView {
                List($entries) {
                    $entry in
                    HStack {
                        Spacer()
                        Button(action: {
                            entry.text = "Hellow"
                        }, label: {
                            Text("\(entry.text)").padding()
                                .font(.system(size: Double(entry.id) * 20 + 20))
                                
                        })
                        
                            
                        Spacer()
                    }
                    
                }
            //}
            
        }
        .padding()
        
    }
}

#Preview {
    UIexampleView()
}
