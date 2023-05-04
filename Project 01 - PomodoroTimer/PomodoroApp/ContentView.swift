//
//  ContentView.swift
//  PomodoroApp
//
//  Created by Akyl Mukatay  on 20.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MainView()
                .tabItem {
                    Image("HomeWhite")
                    Text("Main")
                }
                .tag(1)
            
            SettingsView()
            .tabItem {
                Label("Settings", image: "Settings")
            }
            .tag(2)
            
            HistoryView()
            .tabItem {
                Label("History", image: "History")
            }
            .toolbarBackground(Color(red: 28/255, green: 28/255, blue: 28/255), for: .tabBar)
            .tag(3)
        }
        .tint(.white)
    }
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
