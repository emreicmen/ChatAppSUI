//
//  MainTabView.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 11.12.2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        NavigationView {
            //TabView
            //EachView for tab like channels,chats and settings
            TabView(selection: $selectedIndex) {
                ConversationsView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "bubble.left")
                    }
                    .tag(0)
                ChannelsView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "bubble.left.and.bubble.right")
                    }
                    .tag(1)
                SettingsView()
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "gear")
                    }
                    .tag(2)
            }
            .navigationTitle(tabTitle)
        }
    }
    var tabTitle: String {
        switch selectedIndex{
        case 0: return "Chats"
        case 1: return "Channels"
        case 2: return "Settings"
        default: return ""
        }
    }
}

#Preview {
    MainTabView()
}
