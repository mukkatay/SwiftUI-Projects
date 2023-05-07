//
//  WelcomePage.swift
//  RockPaperScissorsApp
//
//  Created by Akyl Mukatay  on 14.04.2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("BackgroundImage")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Welcome to the game!")
                        .font(.system(size: 54, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.top, 104)
                    Spacer()
                    AppButton(text: "Single player")
                    AppButton(text: "Multi player")
                        .padding(.bottom, 24)
                }
            }
        }
        
    }
}

struct AppButton: View {
    var text: String
    
    var body: some View {
        Button {
            //action
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color(red: 0.404, green: 0.314, blue: 0.643))
                    .frame(height: 50)
                Text(text)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
        }

    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
