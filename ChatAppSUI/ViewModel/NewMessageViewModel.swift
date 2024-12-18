//
//  NewMessageViewModel.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 18.12.2024.
//

import Foundation
import SwiftUI
import FirebaseFirestore


class NewMessageViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
                
            
//            documents.forEach { document in
//                guard let user = try? document.data(as: User.self) else {return}
//                self.users.append(user)
//            }
            
            //This is the shotrcut for appending users to users array
            self.users = documents.compactMap({ try? $0.data(as: User.self) }).filter({ $0.id != AuthViewModel.shared.userSession?.uid })
            
            print("DEBUG: Users: \(self.users)")

        }
    }
}
