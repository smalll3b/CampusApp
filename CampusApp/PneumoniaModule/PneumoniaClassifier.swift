//
//  PneumoniaClassifier.swift
//  CampusApp
//
//  Created by smalll3b on 13/1/2026.
//

import CoreML
import Vision
import CoreImage

struct PneumoniaClassifier {
    private(set) var results: String?
    mutating func detect(ciImage: CIImage) {
        let config = MLModelConfiguration()
        config.computeUnits = .cpuOnly
        guard let model = try? VNCoreMLModel(for: Pneumonia(configuration: config).model) else {
            return
        }
        let request = VNCoreMLRequest(model: model)
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        try? handler.perform([request])
        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }
        if let firstResult = results.first {
            self.results = firstResult.identifier
        }
    }
}
