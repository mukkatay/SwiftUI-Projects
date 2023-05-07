//
//  MainWithTabItem.swift
//  WaterBalanceUI
//
//  Created by Akyl Mukatay  on 08.04.2023.
//

import SwiftUI

struct MainWithTabItem: View {
    @State
    private var selectedTab: Int = 1
    var body: some View {
        TabView(selection: $selectedTab) {
            WaterBalance()
                .tabItem {
                    Label("Main", image: "home")
                }
                .tag(1)
            
            Settings()
                .tabItem {
                    Label("Settings", image: "settings")
                }
                .tag(2)
            
            History()
                .tabItem {
                    Label("History", image: "history")
                }
                .tag(3)
        }
    }
}

struct MainWithTabItem_Previews: PreviewProvider {
    static var previews: some View {
        MainWithTabItem()
    }
}
