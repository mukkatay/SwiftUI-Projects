//
//  ContentView.swift
//  FizzBuzzPopReaction
//
//  Created by Akyl Mukatay  on 16.04.2023.
//

import SwiftUI

enum ScreenState {
    case mainPrepare
    case main
//    case result
//    case leaderboard
//    case settings
//    case configure
}

struct ContentView: View {
    @State var screenState: ScreenState = .mainPrepare
    
    var body: some View {
        switch screenState {
        case .mainPrepare:
            MainViewPrepare(screenState: $screenState)
        case .main:
            MainView(screenState: $screenState)
//        case .result:
//            break
//        case .leaderboard:
//            break
//        case .settings:
//            break
//        case .configure:
//            break
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
