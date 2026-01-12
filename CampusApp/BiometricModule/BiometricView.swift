//
//  BiometricView.swift
//  CampusApp
//
//  Created by smalll3b on 5/1/2026.
//

import SwiftUI
import Combine

struct BiometricView: View {
    @StateObject var model = BiometricModel()
    var body: some View {
        VStack {
            if (!model.isAuthenicated) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                if model.isError == true {
                    Text("\(model.errorMessage)")
                }
                
                Button(action: {
                    model.evaluatePolicy()
                }, label: {
                    Text("Click to login")
                })
                
                if model.isAuthenicated == true {
                    Text("Login")
                }
            } else {
                VStack {
                    Spacer()
                    Text("Login ok!")
                    Button(action: {
                        model.isAuthenicated = false
                    }, label: {
                        Text("Click to logout")
                    })
                    Spacer()
                }
            }
        }
//        .sheet(isPresented: $model.isAuthenicated, content: {
//            VStack {
//                Spacer()
//                Text("Login ok!")
//                Spacer()
//            }
//        })
        .padding()
        .onAppear {
            model.checkPolicy()
        }
    }
}

#Preview {
    BiometricView()
}
