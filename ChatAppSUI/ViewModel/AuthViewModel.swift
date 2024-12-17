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
    
    @Published var didAuthenticateUser = false
    private var tempCurrentUser: FirebaseAuth.User?
    
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
            self.tempCurrentUser = user

            let data: [String: Any] = ["email": email,
                                       "userName:": userName,
                                       "fullName:": fullName]
            
            Firestore.firestore().collection("Users").document(user.uid).setData(data) { _ in
                self.didAuthenticateUser = true
            }
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempCurrentUser?.uid else {
            print("DEBUG: Failed to set temp current user")
            return
        }
        
        ImageUploader.uploadImage(image: image) { imageUrl in
            Firestore.firestore().collection("Users").document(uid).updateData(["profileImageUrl": imageUrl]) { _ in
                print("DEBUG: Succesfully updated user data")
            }
        }
    }
    
    func signOut() {
        
    }
    
}
