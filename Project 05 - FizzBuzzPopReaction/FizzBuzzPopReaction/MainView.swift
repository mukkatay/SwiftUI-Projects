//
//  MainView.swift
//  FizzBuzzPopReaction
//
//  Created by Akyl Mukatay  on 16.04.2023.
//

import SwiftUI

struct MainView: View {
    @Binding var screenState: ScreenState
    @State var number = 25
    @State var squareColor = ViewColors.board.colorValue
    
    var body: some View {
        ZStack {
            ViewColors.bg.colorValue
            VStack {
                Timer()
                Board(text: "Fizz Buzz")
                Status(message: "Select 4 numbers")
                Spacer()
                VStack {
                    HStack {
                        
                        Button {
                            checkNumber()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .frame(width: 82, height: 48)
                                    .foregroundColor(squareColor)
                                Text("\(number)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                            }
                        }

                        inputChip(text: "12", color: ViewColors.board.colorValue)
                        inputChip(text: "5", color: ViewColors.board.colorValue)
                        inputChip(text: "5", color: ViewColors.inputChipCorrect.colorValue)
                    }
                    HStack {
                        inputChip(text: "9", color: ViewColors.board.colorValue)
                        inputChip(text: "18", color: ViewColors.board.colorValue)
                        inputChip(text: "25", color: ViewColors.board.colorValue)
                        inputChip(text: "21", color: ViewColors.board.colorValue)
                    }
                }
                .padding(.bottom, 46)
                
                TabBar(text: "Two more left", color: ViewColors.btn2.colorValue)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
    
    func checkNumber() {
        if number % 3 == 0 {
            squareColor = ViewColors.inputChipCorrect.colorValue
        } else {
            squareColor = ViewColors.inputChipWrong.colorValue
        }
    }
    
    func inputChip(text: String, color: Color) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 82, height: 48)
                .foregroundColor(color)
            if color == ViewColors.inputChipCorrect.colorValue {
                Text(text).foregroundColor(.black).font(.system(size: 16, weight: .semibold))
            } else if color == ViewColors.inputChipWrong.colorValue {
                Text(text).foregroundColor(.white).opacity(0.5).font(.system(size: 16, weight: .semibold))
            } else {
                Text(text).foregroundColor(.white).font(.system(size: 16, weight: .semibold))
            }
        }

    }
}

struct MyTimer: View {
    var body: some View {
        Text(Date().addingTimeInterval(3), style: .timer)
            .environment(\.locale, Locale(identifier: "en_GB"))
            .foregroundColor(.white)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(screenState: .constant(.main))
    }
}
