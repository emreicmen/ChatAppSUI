//
//  MessageView.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 13.12.2024.
//

import SwiftUI

struct MessageView: View {
    var isFromCurrentUser: Bool
    var messageText: String
    var body: some View {
        HStack{
            if isFromCurrentUser {
                Spacer()
                Text(messageText)
                    .padding(10)
                    .background(Color(.blue))
                    .font(.system(size: 15))
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.leading, 100)
                    .padding(.horizontal)
            }else {
                HStack(alignment: .bottom){
                    Image("batman")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    Text(messageText)
                        .padding(10)
                        .background(Color(.systemGray5))
                        .font(.system(size: 15))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                .padding(.trailing, 80)
                Spacer()
            }
        }
    }
}

#Preview {
    //MessageView(isFromCurrentUser: false)
    //MessageView(isFromCurrentUser: true)
}
