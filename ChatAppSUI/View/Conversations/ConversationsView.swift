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
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            if let user = selectedUser {
                NavigationLink("", destination: ChatsView(user: user), isActive: $showChatView)
            }
            
            ScrollView {
                VStack(alignment: .leading){
                    ForEach((0...10), id: \.self){ _ in
                        NavigationLink {
                            ChatsView(user: MOCK_USER)
                        } label: {
                            ConversationCell()
                        }
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
