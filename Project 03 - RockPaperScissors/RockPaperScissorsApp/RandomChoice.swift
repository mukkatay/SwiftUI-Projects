//
//  RandomChoice.swift
//  RockPaperScissorsApp
//
//  Created by Akyl Mukatay  on 14.04.2023.
//

import SwiftUI

func random() -> Choices {
    var result: Choices = .none
    while(result == Choices.none) {
        result = Choices.allCases.randomElement()!
    }
    return result
}
