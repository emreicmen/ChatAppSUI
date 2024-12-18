//
//  User.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 18.12.2024.
//

import Foundation
import SwiftUI
import FirebaseFirestore

struct User: Identifiable, Decodable {
    
    @DocumentID var id: String?
    
    let email: String
    let fullName: String
    let profileImageUrl: String
    let userName: String
    
}
