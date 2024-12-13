//
//  Extensions.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 13.12.2024.
//

import UIKit

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
