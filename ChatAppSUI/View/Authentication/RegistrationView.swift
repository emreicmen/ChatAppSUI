//
//  RegistrationView.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 11.12.2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var userName = ""
    @State private var fullName = ""
    @Environment(\.presentationMode) var mode
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        
        VStack{
            VStack(alignment: .leading, spacing: 10){
                HStack {
                    Spacer()
                }
                Text("Get Started!")
                    .font(.largeTitle)
                    .bold()
                Text("Create your Account")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.green)
                
                VStack(spacing: 25){
                    CustomTextField(imageName: "envelope.fill", placeHolderText: "E-mail", isSecureField: false, text: $email)
                    CustomTextField(imageName: "person.bubble", placeHolderText: "Username", isSecureField: false, text: $userName)
                    CustomTextField(imageName: "person.text.rectangle", placeHolderText: "Full Name", isSecureField: false, text: $fullName)
                    CustomTextField(imageName: "lock.shield", placeHolderText: "Password", isSecureField: true, text: $password)
                }
                .padding([.top, .horizontal], 30)
            }
            .padding(.leading)
            Button {
                viewModel.register(withEmail: email, password: password, fullName: fullName, userName: userName)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 350, height: 50)
                    .background(Color.green)
                    .clipShape(Capsule())
                    .padding()
            }
            .padding(.top, 25)
            .shadow(color: .gray, radius: 10, x:0.0, y:0.0)
            Spacer()
            Button {
                mode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 15))
                    Text("Sign In")
                        .font(.system(size: 15, weight: .semibold))
                }
            }
        }
    }
}

#Preview {
    RegistrationView()
}
