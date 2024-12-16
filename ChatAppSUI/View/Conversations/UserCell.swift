//
//  UserCell.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 13.12.2024.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        VStack {
            HStack {
                //İmage
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                
                //Message Info
                VStack(alignment: .leading) {
                    Text("The Batman")
                        .font(.system(size: 15, weight: .semibold))
                    Text("Bruce Wayne")
                        .font(.system(size: 13))
                }
                .foregroundColor(.black)
                .frame(width: 10)
                Spacer()
            }
        }
        .padding(.top)
    }
}

#Preview {
    UserCell()
}
