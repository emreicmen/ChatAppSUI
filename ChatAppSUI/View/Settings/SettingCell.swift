//
//  SettingCell.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 11.12.2024.
//

import SwiftUI

struct SettingCell: View {
    
    let viewModel: SettingsCellViewModel
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding(6)
                    .background(viewModel.backgroundColor)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                Text(viewModel.title)
                    .font(.system(size: 15))
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)

            }
            .padding([.top, .horizontal])
            Divider()
                .padding(.leading)
        }
        .background(Color.white)
    }
}

#Preview {
    //SettingCell()
}
