//
//  ChatsView.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 11.12.2024.
//

import SwiftUI

struct ChatsView: View {
    var body: some View {
        
        VStack {
            //Messages
            ScrollView {
                VStack(alignment: .leading, spacing: 10){
                    ForEach((0...10), id: \.self){ _ in
                        MessageView(isFromCurrentUser: true)
                    }
                    
                }
            }
            
            //İnput textfield
        }
        .navigationTitle("Bruce Wayne")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
}

#Preview {
    ChatsView()
}
