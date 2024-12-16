//
//  Message.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 16.12.2024.
//

import Foundation

struct Message: Identifiable {
    
    let id = NSUUID().uuidString
    let isFromCurrentUser: Bool
    let messageText: String
    
    
    

}
