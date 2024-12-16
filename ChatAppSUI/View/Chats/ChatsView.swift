//
//  ChatsView.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 11.12.2024.
//

import SwiftUI

struct ChatsView: View {
    @State private var messageText = ""
    @ObservedObject var viewModel = ChatViewModel()
    
    var body: some View {
        
        VStack {
            //Messages
            ScrollView {
                VStack(alignment: .leading, spacing: 10){
                    ForEach(viewModel.messages){ message in
                        MessageView(isFromCurrentUser: message.isFromCurrentUser, messageText: message.messageText)
                    }
                    
                }
            }
            
            //İnput textfield
            CustomInputView(text: $messageText, action: sendMessage)
        }
        .navigationTitle("Bruce Wayne")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}

#Preview {
    ChatsView()
}
