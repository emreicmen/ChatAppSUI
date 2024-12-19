//
//  UserCell.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 13.12.2024.
//

import SwiftUI

struct ConversationCell: View {
    
    let viewModel: MessageViewModel
    
    var body: some View {
        VStack {
            HStack {
                //İmage
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                //Message Info
                VStack(alignment: .leading) {
                    Text("Bruce Wayne")
                        .font(.system(size: 15, weight: .semibold))
                    Text(viewModel.message.text)
                        .font(.system(size: 13))
                }
                .foregroundColor(.black)
                Spacer()
            }
            Divider()
        }
        .padding(.top)
    }
}

#Preview {
    //ConversationCell()
}
