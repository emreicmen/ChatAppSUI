//
//  AuthViewModel.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 16.12.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import SwiftUICore

class AuthViewModel: NSObject, ObservableObject {
    
    func login() {
        print("Login user from viewModel...")
    }
    
    func register(withEmail email: String, password: String, fullName: String, userName: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register wiht error: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            
            let data: [String: Any] = ["email": email,
                                       "userName:": userName,
                                       "fullName:": fullName]
            
            Firestore.firestore().collection("Users").document(user.uid).setData(data) { _ in
                print("DEBUG: Succesfully updated user info in firestore")
            }
        }
    }
    
    func uploadProfileImage(image: UIImage?) {
        print("Profile Image uploaded")
    }
    
    func signOut() {
        
    }
    
}
