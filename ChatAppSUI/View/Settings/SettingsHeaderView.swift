//
//  SettingsHeaderView.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 11.12.2024.
//

import SwiftUI

struct SettingsHeaderView: View {
    var body: some View {
        HStack{
            Image("batman")
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .clipShape(Circle())
                .padding(.leading, 20)
            
            VStack(alignment: .leading, spacing: 5){
                Text("Bruce Wayne")
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
