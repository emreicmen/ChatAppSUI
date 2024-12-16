//
//  AuthViewModel.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 16.12.2024.
//

import FirebaseAuth

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
            print("DEBUG: Successfully registered user with firebase!!!")
        }
       
    }
    
    func uploadProfileImage() {
        
    }
    
    func signOut() {
        
    }
    
}
