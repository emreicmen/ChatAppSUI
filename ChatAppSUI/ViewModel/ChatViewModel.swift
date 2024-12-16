//
//  ChatViewModel.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 16.12.2024.
//

import Foundation

class ChatViewModel: ObservableObject {
    
    @Published var messages = [Message]()
    
    init() {
        messages = mockMessages
    }
    
    var mockMessages: [Message] {
        [
            .init(isFromCurrentUser: true, messageText: "Hey what's up man"),
            .init(isFromCurrentUser: false, messageText: "Where have you been"),
            .init(isFromCurrentUser: true, messageText: "What is game what we will play on tonight"),
            .init(isFromCurrentUser: false, messageText: "Did you hear all of those messages"),
            .init(isFromCurrentUser: true, messageText: "Yea! I head of course"),
            .init(isFromCurrentUser: false, messageText: "Let roll than!!"),
            .init(isFromCurrentUser: true, messageText: "Sure lets roll some balls!!!")
        ]
    }
    
    func sendMessage(_ messageText: String) {
        let message = Message(isFromCurrentUser: true, messageText: messageText)
        messages.append(message)
    }
    
}
