//
//  ChatResponse.swift
//  DSeekApp
//
//  Created by itst on 25/11/2025.
//

import Foundation

struct ChatResponse : Decodable {
    let choices : [ChatChoice]?
}

struct ChatChoice : Decodable {
    let message : ChatMessage?
}

struct ChatMessage : Decodable {
    let content : String?
}
