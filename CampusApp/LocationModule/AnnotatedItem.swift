//
//  AnnotatedItem.swift
//  CampusApp
//
//  Created by smalll3b on 12/1/2026.
//

import MapKit
import Foundation

struct AnnotatedItem: Identifiable {
    let id = UUID()
    let name: String
    var coordinate: CLLocationCoordinate2D
}
