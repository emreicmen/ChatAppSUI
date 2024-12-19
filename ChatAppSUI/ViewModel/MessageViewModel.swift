//
//  MessageViewModel.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 18.12.2024.
//

import Foundation

class MessageViewModel: ObservableObject {
    
    @Published var user: User?
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
    
    var chatPartnerId: String {
        return message.fromId == currentUid ? message.toId : message.fromId
    }
    
    var charPartnerProfileImageUrl: URL? {
        guard let user = user else { return nil }
        return URL(string: user.profileImageUrl)
    }
    
    var fullName: String {
        guard let user = user else { return "" }
        return user.fullName
    }
    func fetchUser() {
        COLLECTION_USERS.document(chatPartnerId).getDocument { snapshot, _ in
            self.user = try? snapshot?.data(as: User.self)
        }
    }
}
