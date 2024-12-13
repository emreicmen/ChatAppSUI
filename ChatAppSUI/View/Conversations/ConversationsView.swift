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
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            NavigationLink("", destination: ChatsView(), isActive: $showChatView)
            //Chats
            ScrollView {
                VStack(alignment: .leading){
                    ForEach((0...10), id: \.self){ _ in
                        ConversationCell()
                            .padding(.horizontal)
                    }
                }
            }
            
            //Floating add button
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
                NewMessageView(showChatView: $showChatView)
            })

        }
    }
}

#Preview {
    ConversationsView()
}
