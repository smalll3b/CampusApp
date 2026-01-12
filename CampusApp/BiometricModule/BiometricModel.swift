//
//  BiometricModel.swift
//  BioEx
//
//  Created by itst on 18/11/2025.
//

import Foundation
import LocalAuthentication
import Combine

class BiometricModel : ObservableObject {
    let context = LAContext()
    
    @Published var isError = false
    @Published var errorMessage = ""
    @Published var isAuthenicated : Bool = false
    
    func checkPolicy(){
        var error : NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            self.isError = false
        } else {
            if let err = error {
                self.isError = true
                switch err.code {
                case LAError.Code.biometryNotEnrolled.rawValue:
                    self.errorMessage = "not enrolled"
                case LAError.Code.biometryNotAvailable.rawValue:
                    self.errorMessage = "not available"
                default:
                    self.errorMessage = "unknown error"
                }
            }
        }
    }
    
    func evaluatePolicy() {
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                               localizedReason: "Authentication is required", reply: {
            success, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.isError = true
                    self.errorMessage = "CAnnot login"
                } else {
                    self.isError = false
                    self.isAuthenicated = true
                }
            }
        })
    }
}
