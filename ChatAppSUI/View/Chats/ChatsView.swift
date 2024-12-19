//
//  ChatsView.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 11.12.2024.
//

import SwiftUI

struct ChatsView: View {
    
    @State private var messageText = ""
    @ObservedObject var viewModel: ChatViewModel
    private let user: User
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10){
                    ForEach(viewModel.messages){ message in
                        MessageView(viewModel: MessageViewModel(message))
                    }
                    
                }
            }
            
            CustomInputView(text: $messageText, action: sendMessage)
        }
        .navigationTitle(user.userName)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}

#Preview {
    //ChatsView()
}
