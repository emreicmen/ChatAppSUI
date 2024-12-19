//
//  UserCell.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 13.12.2024.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    
    @ObservedObject var viewModel: MessageViewModel
    
    
    var body: some View {
        VStack {
            HStack {
                KFImage(viewModel.charPartnerProfileImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(viewModel.fullName)
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
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    //ConversationCell()
}
