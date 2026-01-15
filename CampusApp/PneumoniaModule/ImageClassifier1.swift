//
//  ImageClassifier.swift
//  CampusApp
//
//  Created by smalll3b on 13/1/2026.
//

import SwiftUI
import Combine

class ImageClassifier1: ObservableObject {
    @Published private var classifier = PneumoniaClassifier()

    var imageClass: String? {
        classifier.results
    }

    func detect(uiImage: UIImage) {
        guard let ciImage = CIImage(image: uiImage) else { return }
        classifier.detect(ciImage: ciImage)
    }
}
