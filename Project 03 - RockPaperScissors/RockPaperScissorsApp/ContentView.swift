//
//  ContentView.swift
//  RockPaperScissorsApp
//
//  Created by Akyl Mukatay  on 14.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.init(red: 250/255, green: 250/255, blue: 250/255)
            VStack {
                LabelText(text: "Your pick")
                
                Score()
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255))
                            .frame(height: 128)
                        Text("✂️")
                            .font(.system(size: 80))
                    }
                    .frame(width: 198, height: 128)
                    .scaledToFit()
                    .offset(x: 40, y: -40)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 220, height: 150)
                            .foregroundColor(Color(red: 250/255, green: 250/255, blue: 250/255))
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 48)
                                .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255))
                                .frame(height: 128)
                            Text("✂️")
                                .font(.system(size: 80))
                        }
                        .frame(width: 198, height: 128)
                            
                    }
                    .scaledToFit()
                    .offset(x: -40, y: 40)
                    
                }
                .padding(.top, 134)
                
                Spacer()
                AppButton(text: "Another round")
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                
            }
        }
        .ignoresSafeArea()
        .navigationTitle("Round #1")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
