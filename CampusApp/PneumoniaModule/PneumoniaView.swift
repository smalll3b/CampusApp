//
//  ContentView.swift
//  CampusApp
//
//  Created by smalll3b on 13/1/2026.
//

import SwiftUI

struct PneumoniaView: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @ObservedObject var classifier: ImageClassifier1

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "photo")
                    .onTapGesture {
                        sourceType = .photoLibrary
                        isPresenting = true
                    }
                Image(systemName: "camera")
                    .onTapGesture {
                        sourceType = .camera
                        isPresenting = true
                    }
            }
            .font(.title)
            .foregroundColor(.blue)

            Rectangle()
                .strokeBorder()
                .foregroundColor(.yellow)
                .overlay(
                    Group {
                        if let uiImage = uiImage {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                )

            VStack {
                Button(action: {
                    if let uiImage = uiImage {
                        classifier.detect(uiImage: uiImage)
                    }
                }) {
                    Image(systemName: "bolt.fill")
                        .foregroundColor(.orange)
                        .font(.title)
                }

                Group {
                    if let imageClass = classifier.imageClass {
                        HStack {
                            Text("Prediction:")
                                .font(.caption)
                            Text(imageClass)
                                .bold()
                        }
                    } else {
                        HStack {
                            Text("Prediction: NA")
                                .font(.caption)
                        }
                    }
                }
                .font(.subheadline)
                .padding()
            }
        }
        .sheet(isPresented: $isPresenting) {
            ImagePicker1(uiImage: $uiImage,
                        isPresenting: $isPresenting,
                        sourceType: $sourceType)
                .onDisappear {
                    if let uiImage = uiImage {
                        classifier.detect(uiImage: uiImage)
                    }
                }
        }
        .padding()
    }
}

struct PneumoniaView_Previews: PreviewProvider {
    static var previews: some View {
        PneumoniaView(classifier: ImageClassifier1())
    }
}
