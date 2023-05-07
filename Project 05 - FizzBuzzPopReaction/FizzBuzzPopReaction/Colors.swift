//
//  Colors.swift
//  FizzBuzzPopReaction
//
//  Created by Akyl Mukatay  on 16.04.2023.
//

import SwiftUI

enum ViewColors {
    case bg
    case btn1
    case board
    case circle
    case btn2
    case inputChipCorrect
    case inputChipWrong
    
    var colorValue: Color {
        switch self {
        case .bg:
            return Color(red: 22/255, green: 22/255, blue: 22/255)
        case .btn1:
            return Color(red: 255/255, green: 221/255, blue: 95/255)
        case .board:
            return Color(red: 32/255, green: 32/255, blue: 32/255)
        case .circle:
            return Color(red: 52/255, green: 52/255, blue: 54/255)
        case .btn2:
            return Color(red: 197/255, green: 186/255, blue: 145/255)
        case .inputChipCorrect:
            return Color(red: 236/255, green: 228/255, blue: 199/255)
        case .inputChipWrong:
            return Color(red: 215/255, green: 0, blue: 21/255)
        }
    }
}
