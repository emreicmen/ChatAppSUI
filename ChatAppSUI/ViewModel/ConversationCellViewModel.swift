//
//  ConversationCellViewModel.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 19.12.2024.
//

import Foundation

class ConversationCellViewModel: ObservableObject {
    
    @Published var user: User?
    @Published var message: Message

    init(_ message: Message) {
        
        self.message = message
        fetchUser()
    }
    
    var chatPartnerId: String {
        return message.fromId == AuthViewModel.shared.userSession?.uid ? message.toId : message.fromId
    }
    
    var charPartnerProfileImageUrl: URL? {
        guard let user = message.user else { return nil }
        return URL(string: user.profileImageUrl)
    }
    
    var fullName: String {
        guard let user = message.user else { return "" }
        return user.fullName
    }
    func fetchUser() {
        COLLECTION_USERS.document(chatPartnerId).getDocument { snapshot, _ in
            self.message.user = try? snapshot?.data(as: User.self)
        }
    }
    
}
