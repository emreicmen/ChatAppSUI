//
//  Message.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 16.12.2024.
//

import Foundation
import Firebase
import FirebaseFirestore

struct Message: Identifiable, Decodable {
    
    
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
    
    var user: User?

}
