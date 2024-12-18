//
//  ChatViewModel.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 16.12.2024.
//

import Foundation
import Firebase

class ChatViewModel: ObservableObject {
    
    @Published var messages = [Message]()
    let user: User
    
    init(user: User) {
        self.user = user
        
        fetchMessages()
    }
    
    func fetchMessages() {
        
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let chatPartnerId = user.id else { return }
        
        let query = COLLECTION_MESSAGES.document(currentUid).collection(chatPartnerId)
        
        query.getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching documents: \(error)")
                return
            }

            guard let documents = snapshot?.documents else {
                print("No documents found.")
                return
            }

            do {
                self.messages = try documents.compactMap { document in
                    try document.data(as: Message.self)
                }
                for message in self.messages {
                    print("golem: \(message)")
                }
            } catch {
                print("Error decoding documents: \(error)")
            }
        }

    }
    
    func sendMessage(_ messageText: String) {
        
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let chatPartnerId = user.id else { return }
        
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(chatPartnerId).document()
        
        let chatPartnerRef = COLLECTION_MESSAGES.document(chatPartnerId).collection(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let data: [String: Any] = ["text": messageText,
                                   "fromId": currentUid,
                                   "toId": chatPartnerId,
                                   "read": false,
                                   "timestamp": Timestamp(date: Date())]
        
        currentUserRef.setData(data)
        chatPartnerRef.document(messageId).setData(data)
    }
    
}
