//
//  MyLocationView.swift
//  CampusApp
//
//  Created by smalll3b on 12/1/2026.
//

import SwiftUI
import CoreLocation
import MapKit
import Combine

struct MyLocationView: View {
    @StateObject var locationModel = LocationModel()

    var body: some View {
        VStack {
            if locationModel.authorizationStatus == .authorizedWhenInUse ||
                locationModel.authorizationStatus == .authorizedAlways {
                if let loc = locationModel.lastLocation {
                    Text("Lat: \(loc.coordinate.latitude)")
                    Text("Lng: \(loc.coordinate.longitude)")
                }
                Map(coordinateRegion: $locationModel.coordinateRegion)
            } else {
                Button("Request Permission") {
                    locationModel.requestPermission()
                }
            }
        }
        .padding()
    }
}

