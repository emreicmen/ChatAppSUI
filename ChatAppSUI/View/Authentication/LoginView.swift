//
//  LoginView.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 11.12.2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        NavigationView {
            VStack{
                VStack(alignment: .leading, spacing: 10){
                    HStack {
                        Spacer()
                    }
                    Text("Hello!")
                        .font(.largeTitle)
                        .bold()
                    Text("Welcome to ChatApp")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.blue)
                    HStack { 
                        Spacer()
                        Image("ChatAppLogo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .padding([.top, .bottom], 30)
                        Spacer()
                    }
                    VStack(spacing: 20){
                        CustomTextField(imageName: "envelope.fill", placeHolderText: "E-mail", isSecureField: false, text: $email)
                        CustomTextField(imageName: "lock.shield", placeHolderText: "Password", isSecureField: true, text: $password)
                    }
                    .padding(.horizontal,15)
                    //.padding(.top, 150)
                }
                HStack{
                    Spacer()
                    NavigationLink {
                        Text("Reset Password...")
                    } label: {
                        Text("Forgot Password?")
                            .font(.system(size: 13, weight: .semibold))
                            .padding(.top)
                            .padding(.trailing, 25)
                    }
                }
                Button {
                    viewModel.login(withEmail: email, password: password)
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 350, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray, radius: 10, x:0.0, y:0.0)
                Spacer()
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("Don't have an account?")
                            .font(.system(size: 15))
                        Text("Sign Up")
                            .font(.system(size: 15, weight: .semibold))
                    }
                }
            }
        }
        .padding(.leading)
    }
}

#Preview {
    LoginView()
}


