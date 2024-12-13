//
//  EditProfileView.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 12.12.2024.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var fullName = "Bruce Wayne"
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 50){
                VStack{
                    TextField("", text: $fullName)
                        .padding(.top, 10)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .frame(height: 40)
                        .bold()
                        .font(.system(size: 25))

                    HStack{
                        VStack {
                            if let profileImage = profileImage {
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 75, height: 75)
                                    .clipShape(Circle())
                            }else{
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 75, height: 75)
                                    .clipShape(Circle())
                            }
                        }
                        .padding([.top, .leading])
                        Text("Enter your name or change profile photo")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                            .padding([.leading, .trailing], 5)
                    }
                    Button {
                        showImagePicker.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "photo.tv")
                                .font(.headline)
                            Text("Choose Photo")
                                .font(.headline)
                        }
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 175, height: 40)
                            .background(Color.green)
                            .clipShape(Capsule())
                            .padding()
                            .fullScreenCover(isPresented: $showImagePicker, onDismiss: loadImage) {
                                ImagePicker(image: $selectedImage)
                            }
                    }
                    
                    Divider()
                        .padding(.horizontal)
                }
                .background(Color.white)
                VStack{
                    Text("Status")
                        .padding()
                        .foregroundColor(Color(.darkGray))
                    NavigationLink {
                        StatusSelectorView()
                    } label: {
                        HStack{
                            Text("At the movies")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                    }
                }
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

#Preview {
    EditProfileView()
}
