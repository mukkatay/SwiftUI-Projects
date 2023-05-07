//
//  WelcomeView.swift
//  FizzBuzzPopReaction
//
//  Created by Akyl Mukatay  on 16.04.2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                ViewColors.bg.colorValue
                VStack {
                    Text("ARE \nYOU \nREADY?")
                        .font(.system(size: 64, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 358, height: 232, alignment: .leading)
                        .padding(.top, 132)
                    
                    
                    Spacer()
                    
                    NavigationLink {
                        ContentView()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 100)
                                .frame(width: 358, height: 50)
                                .foregroundColor(ViewColors.btn1.colorValue)
                            Text("Let's start")
                                .foregroundColor(.black)
                        }
                        .padding(.bottom, 40)
                    }

                    
                    
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
