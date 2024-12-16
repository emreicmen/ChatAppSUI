//
//  ProfilePhotoSelectorView.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 16.12.2024.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    //@EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        VStack{
            Button {
                imagePickerPresented.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                        .padding(.top, 25)
                }else {
                    Image(systemName: "photo.circle")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 25)
                        .foregroundColor(.blue)
                }
            }
            .fullScreenCover(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                ImagePicker(image: $selectedImage)
            }
//            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
//                ImagePicker(image: $selectedImage)
//            }
            
            Text(profileImage == nil ? "Select a profile photo" : "Great! Tap to below to continue")
                .font(.system(size: 20, weight: .semibold))
            
            if let image = selectedImage {
                Button {
                    viewModel.uploadProfileImage(image: image)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 350, height: 50)
                        .background(Color.green)
                        .clipShape(Capsule())
                        .padding()
                }
                .padding(.top, 25)
                .shadow(color: .gray, radius: 10, x:0.0, y:0.0)
            
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
