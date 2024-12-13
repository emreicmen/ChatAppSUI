//
//  SettingsCellViewModel.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 11.12.2024.
//
import SwiftUI

enum SettingsCellViewModel: Int, CaseIterable {
    
    case account
    case natifications
    case starredMessages
    
    var title: String {
        switch self {
        case .account: return "Account"
        case .natifications: return "Natifications"
        case .starredMessages: return "Starred Messages"
        }
    }
    
    var imageName: String {
        switch self {
        case .account: return "key.fill"
        case .natifications: return "bell.badge.fill"
        case .starredMessages: return "star.fill"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .account: return .blue
        case .natifications: return .red
        case .starredMessages: return .yellow
        }
    }
    
}


