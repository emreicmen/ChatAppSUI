//
//  MessageViewModel.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 18.12.2024.
//

import Foundation

struct MessageViewModel {

    let message: Message
    
    init(_ message: Message) {
        
        self.message = message
    }
    
    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
    
    var profileImageUrl: URL? {
        guard let profileImageUrl = message.user?.profileImageUrl else { return nil }
        return URL(string: profileImageUrl)
    }

}
