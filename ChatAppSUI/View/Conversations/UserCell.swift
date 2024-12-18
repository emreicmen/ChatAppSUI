//
//  UserCell.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 13.12.2024.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                
                //Message Info
                VStack(alignment: .leading) {
                    Text(user.userName)
                        .font(.system(size: 15, weight: .semibold))
                    Text(user.fullName)
                        .font(.system(size: 13))
                }
                .foregroundColor(.black)
                Spacer()
            }
            .padding(.leading, 10)
        }
        .padding(.top)
    }
}

#Preview {
    UserCell(user: MOCK_USER)
}
