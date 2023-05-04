//
//  Colors.swift
//  BookmarkApp
//
//  Created by Akyl Mukatay  on 18.04.2023.
//

import SwiftUI

enum Colors {
    case background
    case primaryButton
    case secondaryButton
    case main
    case line
    
    var value: Color {
        switch self {
        case .background:
            return Color(red: 242/255, green: 242/255, blue: 238/255)
        case .primaryButton:
            return Color.black
        case .secondaryButton:
            return Color.white
        case .main:
            return Color(red: 1, green: 149/255, blue: 0)
        case .line:
            return Color(red: 198/255, green: 198/255, blue: 200/255)
        }
    }
}
