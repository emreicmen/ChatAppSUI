//
//  CustomTextField.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 11.12.2024.
//

import SwiftUI

struct CustomTextField: View {
    let imageName: String
    let placeHolderText: String
    let isSecureField: Bool
    @Binding var text: String
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                if isSecureField{
                    SecureField(placeHolderText, text: $text)
                }else{
                    TextField(placeHolderText, text: $text)
                }
            }
            Divider()
                .background(Color(.darkGray))
        }
    }
}
