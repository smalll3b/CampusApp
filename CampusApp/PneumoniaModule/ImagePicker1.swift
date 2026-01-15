//
//  ImagePicker.swift
//  CampusApp
//
//  Created by smalll3b on 13/1/2026.
//

import SwiftUI
import UIKit

struct ImagePicker1: UIViewControllerRepresentable {
    @Binding var uiImage: UIImage?
    @Binding var isPresenting: Bool
    @Binding var sourceType: UIImagePickerController.SourceType

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker1 = UIImagePickerController()
        imagePicker1.sourceType = sourceType
        imagePicker1.delegate = context.coordinator
        return imagePicker1
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    typealias UIViewControllerType = UIImagePickerController

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker1

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.uiImage = info[.originalImage] as? UIImage
            parent.isPresenting = false
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isPresenting = false
        }

        init(_ parent: ImagePicker1) {
            self.parent = parent
        }
    }
}
