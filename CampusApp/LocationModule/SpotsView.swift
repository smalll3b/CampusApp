//
//  SpotsView.swift
//  CampusApp
//
//  Created by smalll3b on 12/1/2026.
//

import SwiftUI
import MapKit
import CoreLocation

struct SpotsView: View {
    @State private var pointOfInterest = [
        AnnotatedItem(name: "IVE(ST)", coordinate: .init(latitude: 22.39002, longitude: 114.19834)),
        AnnotatedItem(name: "Ocean Park", coordinate: .init(latitude: 22.24825, longitude: 114.17566)),
        AnnotatedItem(name: "The Peak", coordinate: .init(latitude: 22.27723, longitude: 114.14519))
    ]

    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 22.37464, longitude: 114.14907),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )

    @State var nameStr: String = ""
    @State var latStr: String = ""
    @State var lngStr: String = ""

    var body: some View {
        VStack {
            HStack {
                TextField("Name", text: $nameStr).textFieldStyle(.roundedBorder)
                TextField("Lat", text: $latStr).textFieldStyle(.roundedBorder)
                TextField("Lng", text: $lngStr).textFieldStyle(.roundedBorder)
                Button("Add") {
                    let lat = Double(latStr) ?? 0
                    let lng = Double(lngStr) ?? 0
                    let coord = CLLocationCoordinate2D(latitude: lat, longitude: lng)
                    let annotation = AnnotatedItem(name: nameStr, coordinate: coord)
                    pointOfInterest.append(annotation)
                    nameStr = ""
                    latStr = ""
                    lngStr = ""
                }
            }.padding()

            Map(coordinateRegion: $region, annotationItems: pointOfInterest) { item in
                MapMarker(coordinate: item.coordinate)
            }
        }
    }
}

