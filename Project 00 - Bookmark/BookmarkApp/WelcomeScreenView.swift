//
//  WelcomeScreenView.swift
//  BookmarkApp
//
//  Created by Akyl Mukatay  on 19.04.2023.
//

import SwiftUI

struct WelcomeScreenView: View {
    @Binding var screenState: AppScreenState
    
    var body: some View {
        NavigationView {
            VStack {
                Image("image 8")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                ZStack {
                    Rectangle()
                        .frame(height: 250)
                    VStack {
                        Spacer()
                        
                        Text("Save all interesting links in one app")
                            .foregroundColor(Color.white)
                            .font(.system(size: 36, weight: .bold))
                            .padding(.bottom, 8)
                            .padding(.trailing, 30)
                        
                        Button {
                            UserDefaults.standard.set(true, forKey: "isWelcomeSeen")
                            screenState = .main
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(Color.white)
                                Text("Let’s start collecting")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16,weight: .semibold))
                            }
                            .frame(width: 358, height: 58)
                        }
                        .padding(.bottom, 50)

                        
                        
                        
                    }
                }
                
            }
            .ignoresSafeArea()
        }
    }
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView(screenState: .constant(.welcome))
    }
}
