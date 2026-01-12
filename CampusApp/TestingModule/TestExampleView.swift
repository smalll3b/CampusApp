//
//  TestExampleView.swift
//  CampusApp
//
//  Created by smalll3b on 6/1/2026.
//

import SwiftUI

struct TestExampleView: View {
    @State var input = ""
    @State var result = "0.00"
    let converter = Converter()
    var body: some View {
        VStack {
            TextField("BTC", text: $input).font(.title)
                .textFieldStyle(.roundedBorder)
            Button("Convert") {
                result = converter.btcToUsd(btc: Double(input) ?? 0.0 )
            }.font(.title)
            Divider()
            Text(result).font(.title).accessibilityIdentifier("result")
        }
        .padding()
    }
}

#Preview {
    TestExampleView()
}
