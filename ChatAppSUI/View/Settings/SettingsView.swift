//
//  SettingsView.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 11.12.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            VStack(spacing: 30){
                NavigationLink {
                    EditProfileView()
                } label: {
                    SettingsHeaderView()
                }
                VStack(spacing: 5){
                    ForEach((SettingsCellViewModel.allCases), id: \.self) { viewModel in
                        SettingCell(viewModel: viewModel)
                    }
                }
                Button {
                    AuthViewModel.shared.signOut()
                } label: {
                    Text("Log Out")
                        .foregroundColor(.red)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: UIScreen.main.bounds.width, height: 50)
                        .background(Color.white)

                }
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}


