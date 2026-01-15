//
//  ImageClassifier.swift
//  CampusApp
//
//  Created by smalll3b on 13/1/2026.
//

import SwiftUI
import Combine

class ImageClassifier: ObservableObject {
    @Published private var classifier = Classifier()

    var imageClass: String? {
        classifier.results
    }

    // MARK: Intent(s)
    func detect(uiImage: UIImage) {
        guard let ciImage = CIImage(image: uiImage) else { return }
        classifier.detect(ciImage: ciImage)
    }
}
