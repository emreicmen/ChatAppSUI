//
//  StatusViewModel.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 12.12.2024.
//

import Foundation

enum UserStatus: Int, CaseIterable {
    
    case notConfigured
    case available
    case busy
    case scholl
    case movies
    case work
    case batterylow
    case metting
    case gym
    case sleeping
    case urgetCallsOnly
    
    var title: String {
        
        switch self {
        case .notConfigured: return "Click here to update your status"
        case .available: return "Available"
        case .busy: return "Busy"
        case .scholl: return "At School"
        case .movies: return "At the Movies"
        case .work: return "At Work"
        case .batterylow: return "Battery about to die"
        case .metting: return "In a meeting"
        case .gym: return "At the GYM"
        case .sleeping: return "Sleeping"
        case .urgetCallsOnly: return "Urgent calls only"
            
        }
    }
}
