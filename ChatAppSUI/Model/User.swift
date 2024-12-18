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

let MOCK_USER = User(id: "123", email: "Strange@gail.com", fullName: "Steven STRANGE", profileImageUrl: "www.marvel.com.tr", userName: "Doctor Strange")
