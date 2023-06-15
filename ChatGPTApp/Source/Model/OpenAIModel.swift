//
//  OpenAIModel.swift
//  ChatGPTApp
//
//  Created by 드즈 on 2023/06/15.
//

import Foundation
import Alamofire

struct OpenAIChatBody: Encodable {
    let model: String
    let messages: [OpenAIChatMessage]
}

struct OpenAIChatMessage: Codable {
    let role: SenderRole
    let content: String
}


struct OpenAIChatResponse: Decodable {
    let choices: [OpenAIChatChoice]
}

struct OpenAIChatChoice: Decodable {
    let message: OpenAIChatMessage
}

enum SenderRole: String, Codable {
    case system
    case user
    case assistant
}
