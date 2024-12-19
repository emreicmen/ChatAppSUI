//
//  ConversationsView.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 11.12.2024.
//

import SwiftUI

struct ConversationsView: View {
    
    @State private var showNewMessageView = false
    @State private var showChatView = false
    @State var selectedUser: User?
    @ObservedObject var viewModel = ConversationsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            if let user = selectedUser {
                NavigationLink("", destination: ChatsView(user: user), isActive: $showChatView)
            }
            
            ScrollView {
                VStack(alignment: .leading){
                    ForEach(viewModel.recentMessages){ message in
                        ConversationCell(viewModel: ConversationCellViewModel(message))
                        .padding(.horizontal)
                    }
                }
            }
    
            Button {
                showNewMessageView.toggle()
            } label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $showNewMessageView, content: {
                NewMessageView(showChatView: $showChatView, user: $selectedUser)
            })

        }
    }
}

#Preview {
    ConversationsView()
}
