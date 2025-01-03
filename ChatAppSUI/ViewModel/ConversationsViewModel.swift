//
//  ConversationsViewModel.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 19.12.2024.
//

import SwiftUI

class ConversationsViewModel: ObservableObject {
    
    @Published var recentMessages = [Message]()
    
    init() {
        fetchRecentMessages()
    }
    
    func fetchRecentMessages() {
        
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_MESSAGES.document(uid).collection("recent-messages").order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else { return }
            
            self.recentMessages = documents.compactMap({ try? $0.data(as: Message.self) })
        }
    }
    
}
