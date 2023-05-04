//
//  BookmarkAppApp.swift
//  BookmarkApp
//
//  Created by Akyl Mukatay  on 18.04.2023.
//

import SwiftUI

enum AppScreenState {
    case welcome
    case main
}

@main
struct BookmarkAppApp: App {
    @State var state: AppScreenState
    var isWelcomeSeen: Bool
    
    init() {
        self.isWelcomeSeen = AppDataAPI.isWelcome
        switch isWelcomeSeen {
        case true:
            self.state = .main
        case false:
            self.state = .welcome
        }
    }
    
    var body: some Scene {
        WindowGroup {
            switch state {
            case .welcome:
                WelcomeScreenView(screenState: $state)
            case .main:
                BookmarkListView()
            }
        }
    }
}
