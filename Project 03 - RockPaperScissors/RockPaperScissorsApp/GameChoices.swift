//
//  GameChoices.swift
//  RockPaperScissorsApp
//
//  Created by Akyl Mukatay  on 14.04.2023.
//

import SwiftUI

enum Choices: CaseIterable {
    case paper
    case scissors
    case rock
    case none
    
    var icon: String {
        switch self {
        case .paper:
            return "📃"
        case .scissors:
            return "✂️"
        case .rock:
            return "🗿"
        case .none:
            return ""
        }
    }
}

