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
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    private var tempCurrentUser: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    override init() {
        super.init()
        userSession = Auth.auth().currentUser
        
        self.fetchUsers()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error: \(error.localizedDescription)")
                return
            }
            self.userSession = result?.user
        }
    }
    
    func register(withEmail email: String, password: String, fullName: String, userName: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.tempCurrentUser = user

            let data: [String: Any] = ["email": email,
                                       "userName": userName,
                                       "fullName": fullName]
            
            Firestore.firestore().collection("Users").document(user.uid).setData(data) { _ in
                self.didAuthenticateUser = true
            }
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempCurrentUser?.uid else { return }
        ImageUploader.uploadImage(image: image) { imageUrl in
            Firestore.firestore().collection("Users").document(uid).updateData(["profileImageUrl": imageUrl]) { _ in
            }
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    func fetchUsers() {
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("Users").document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            print("Fetched user: \(user)")
            self.currentUser = user
        }
    }
}
