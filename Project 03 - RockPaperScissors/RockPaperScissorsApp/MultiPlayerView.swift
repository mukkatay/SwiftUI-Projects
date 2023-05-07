//
//  MultiPlayerView.swift
//  RockPaperScissorsApp
//
//  Created by Akyl Mukatay  on 14.04.2023.
//

import SwiftUI

struct MultiPlayerView: View {
    @State var screenState: ScreenState = .choose
    @State var selfChoice: Choices = .none
    @State var opponentChoice: Choices = .none
    
    var body: some View {
        switch screenState {
        case .choose:
            ChoiceView2(selfChoice: $selfChoice, screenState: $screenState)
        case .change:
            ChangeChoiceView2(choice: $selfChoice, screenState: $screenState)
        case .opponentChoose:
            OpponentWaitView2(opponentChoice: $opponentChoice, screenState: $screenState)
        case .showOpponent:
            OpponentChoiceView2(opponentChoice: $opponentChoice, screenState: $screenState)
        case .gameResult:
            GameResultView2(screenState: $screenState, selfChoice: $selfChoice, opponentChoice: $opponentChoice)
        }
    }
}

struct ChoiceView2: View {
    @Binding var selfChoice: Choices
    @Binding var screenState: ScreenState
    
    var body: some View {
        ZStack {
            Color.init(red: 250/255, green: 250/255, blue: 250/255)
            VStack {
                LabelText(text: "Take your pick")
                Score()
                VStack(spacing: 24) {
                    RSPButton(icon: "📃")
                        .onTapGesture {
                            selfChoice = .paper
                            screenState = .change
                        }
                    RSPButton(icon: "✂️")
                        .onTapGesture {
                            selfChoice = .scissors
                            screenState = .change
                        }
                    RSPButton(icon: "🗿")
                        .onTapGesture {
                            selfChoice = .rock
                            screenState = .change
                        }
                }
                .padding(.top, 74)
                .padding(.bottom, 120)
                
            }
        }
        .ignoresSafeArea()
        .navigationTitle("Round #1")
    }
}

struct ChangeChoiceView2: View {
    @Binding var choice: Choices
    @Binding var screenState: ScreenState
    
    var body: some View {
        ZStack {
            Color.init(red: 250/255, green: 250/255, blue: 250/255)
            VStack {
                LabelText(text: "Your pick")
                
                Score()
                
                VStack(spacing: 24) {
                    RSPButton(icon: "📃")
                        .opacity(0)
                    RSPButton(icon: choice.icon)
                        .onTapGesture {
                            screenState = .opponentChoose
                        }
                    RSPButton(icon: "📃")
                        .opacity(0)
                }
                .padding(.top, 74)
                
                AppButton(text: "I changed my mind")
                    .onTapGesture {
                        screenState = .choose
                    }
                    .padding(.bottom, 24)
                
            }
        }
        .ignoresSafeArea()
        .navigationTitle("Round #1")
    }
}

struct OpponentWaitView2: View {
    @Binding var opponentChoice: Choices
    @Binding var screenState: ScreenState
    //var result: Choices = Choices.allCases.randomElement()!
    var result: Choices = random()
    
    var body: some View {
        ZStack {
            Color.init(red: 250/255, green: 250/255, blue: 250/255)
            
            VStack {
                LabelText(text: "Pass the phone to your opponent")
                
                Spacer()
                
                AppButton(text: "Ready to continue")
                    .onTapGesture {
                        screenState = .showOpponent
                    }
                    .padding(.bottom, 40)
            }
        }
        .ignoresSafeArea()
        .navigationTitle("Round #1")
        
    }
}

struct OpponentChoiceView2: View {
    @Binding var opponentChoice: Choices
    @Binding var screenState: ScreenState
    
    var body: some View {
        ZStack {
            Color.init(red: 250/255, green: 250/255, blue: 250/255)
            VStack {
                LabelText(text: "Your pick")
                Score()
                VStack(spacing: 24) {
                    RSPButton(icon: "📃")
                        .onTapGesture {
                            opponentChoice = .paper
                            screenState = .gameResult
                        }
                    RSPButton(icon: "✂️")
                        .onTapGesture {
                            opponentChoice = .scissors
                            screenState = .gameResult
                        }
                    RSPButton(icon: "🗿")
                        .onTapGesture {
                            opponentChoice = .rock
                            screenState = .gameResult
                        }
                }
                .padding(.top, 74)
                .padding(.bottom, 120)
                
            }
        }
        .ignoresSafeArea()
        .navigationTitle("Round #1")
    }
}

struct GameResultView2: View {
    @Binding var screenState: ScreenState
    @Binding var selfChoice: Choices
    @Binding var opponentChoice: Choices
    
    var body: some View {
        ZStack {
            Color.init(red: 250/255, green: 250/255, blue: 250/255)
            VStack {
                switch selfChoice {
                case .scissors:
                    switch opponentChoice {
                    case .paper: LabelText(text: "Win!").foregroundColor(.green).onAppear()
                    case .rock: LabelText(text: "Lose!").foregroundColor(.red)
                    case .scissors: LabelText(text: "Tie!").foregroundColor(.yellow)
                    case .none: LabelText(text: "Tie!").foregroundColor(.yellow)
                    }
                case .rock:
                    switch opponentChoice {
                    case .scissors: LabelText(text: "Win!").foregroundColor(.green)
                    case .paper: LabelText(text: "Lose!").foregroundColor(.red)
                    case .rock: LabelText(text: "Tie!").foregroundColor(.yellow)
                    case .none: LabelText(text: "Tie!").foregroundColor(.yellow)
                    }
                case .paper:
                    switch opponentChoice {
                    case .rock: LabelText(text: "Win!").foregroundColor(.green)
                    case .scissors: LabelText(text: "Lose!").foregroundColor(.red)
                    case .paper: LabelText(text: "Tie!").foregroundColor(.yellow)
                    case .none: LabelText(text: "Tie!").foregroundColor(.yellow)
                    }
                case .none:
                    LabelText(text: "Tie!")
                }
                
                Score()
                
                
                HStack {
                    RSPButtonMini(icon: selfChoice.icon)
                        .scaledToFit()
                        .offset(x: 40, y: -40)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 220, height: 150)
                            .foregroundColor(Color(red: 250/255, green: 250/255, blue: 250/255))
                        RSPButtonMini(icon: opponentChoice.icon)
                    }
                    .scaledToFit()
                    .offset(x: -40, y: 40)
                    
                }
                .padding(.top, 134)
                
                Spacer()
                
                AppButton(text: "Another round")
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                    .onTapGesture {
                        screenState = .choose
                    }
            }
        }
        .ignoresSafeArea()
        .navigationTitle("Round #1")
    }
}


struct MultiPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MultiPlayerView()
    }
}
