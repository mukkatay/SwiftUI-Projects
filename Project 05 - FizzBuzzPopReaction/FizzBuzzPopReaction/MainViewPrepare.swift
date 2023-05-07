//
//  MainView.swift
//  FizzBuzzPopReaction
//
//  Created by Akyl Mukatay  on 16.04.2023.
//

import SwiftUI

struct MainViewPrepare: View {
    @Binding var screenState: ScreenState
    
    var body: some View {
        ZStack {
            ViewColors.bg.colorValue
            VStack {
                Timer()
                Board(text: "3...")
                Status(message: "Prepare now")
                Spacer()
                TabBar(text: "Numbers loading...", color: ViewColors.btn2.colorValue)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    screenState = .main
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
}

struct Timer: View {
    var body: some View {
        Text("00:00:01")
            .foregroundColor(.white)
            .font(.system(size: 24, weight: .semibold))
            .padding(.top, 132)
    }
}

struct Board: View {
    var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(ViewColors.board.colorValue)
                .frame(width: 358, height: 200)
            Text(text)
                .font(.system(size: 54, weight: .bold))
                .foregroundColor(.white)
        }
        .padding(.top, 16)
    }
}

struct Status: View {
    var message: String
    
    var body: some View {
        Text(message)
            .foregroundColor(.white)
            .opacity(0.5)
    }
}

struct TabBar: View {
    var text: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 20) {
            Button {
                //action
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(ViewColors.circle.colorValue)
                    Image("Reload")
                }
            }

            
            Button {
                //action
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .frame(width: 196, height: 50)
                        .foregroundColor(color)
                    Text(text)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                }
            }
            
            Button {
                //action
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(ViewColors.circle.colorValue)
                    Image("Star")
                }
            }

        }
        .frame(width: 316, height: 50)
        .padding(.bottom, 40)
    }
}

struct MainViewPrepare_Previews: PreviewProvider {
    static var previews: some View {
        MainViewPrepare(screenState: .constant(.mainPrepare))
    }
}
