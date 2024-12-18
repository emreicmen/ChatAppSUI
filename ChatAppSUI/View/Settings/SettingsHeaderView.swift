//
//  SettingsHeaderView.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 11.12.2024.
//

import SwiftUI
import Kingfisher

struct SettingsHeaderView: View {
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        HStack{
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .clipShape(Circle())
                .padding(.leading, 20)
            
            VStack(alignment: .leading, spacing: 5){
                Text(user.fullName)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.black)
                Text("Available")
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
                
            }
            Spacer()
        }
        .frame(height: 80)
        .background(Color.white)
    }
}
