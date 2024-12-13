//
//  UserCell.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 13.12.2024.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        HStack {
            //İmage
            Image("batman")
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            //Message Info
            VStack(alignment: .leading) {
                Text("Bruce Wayne")
                    .font(.system(size: 15, weight: .semibold))
                Text("Message info")
            }
        }
    }
}

#Preview {
    ConversationCell()
}
