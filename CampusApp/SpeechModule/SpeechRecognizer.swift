//
//  SpeechRecognizer.swift
//  CampusApp
//
//  Created by smalll3b on 15/1/2026.
//

import Foundation
import Speech
import AVFoundation
import Combine

class SpeechRecognizer: ObservableObject {
    @Published var recognizedText = ""
    let audioEngine = AVAudioEngine()

    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "zh-HK")) // 廣東話
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?

    func startListening() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            if authStatus == .authorized {
                DispatchQueue.main.async {
                    self.startRecognizingSpeech()
                }
            } else {
                print("Speech recognition not authorized")
            }
        }
    }

    func stopListening() {
        let inputNode = audioEngine.inputNode
        inputNode.removeTap(onBus: 0)
        audioEngine.stop()
        recognitionRequest?.endAudio()
        recognitionRequest = nil
        recognitionTask?.cancel()
        recognitionTask = nil
    }

    private func startRecognizingSpeech() {
        guard let recognizer = speechRecognizer, recognizer.isAvailable else {
            print("Speech recognizer not available.")
            return
        }

        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        recognitionRequest?.requiresOnDeviceRecognition = true
        guard let recognitionRequest = recognitionRequest else { return }

        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("Failed to configure audio session: \(error)")
        }

        let inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            recognitionRequest.append(buffer)
        }

        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            print("Audio engine failed to start: \(error)")
        }

        recognitionTask = recognizer.recognitionTask(with: recognitionRequest) { result, error in
            if let result = result {
                DispatchQueue.main.async {
                    self.recognizedText = result.bestTranscription.formattedString
                }
            }
            if error != nil {
                self.stopListening()
            }
        }
    }
}
