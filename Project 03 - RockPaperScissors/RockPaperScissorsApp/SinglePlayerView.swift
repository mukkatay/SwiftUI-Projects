//
//  SinglePlayerView.swift
//  RockPaperScissorsApp
//
//  Created by Akyl Mukatay  on 14.04.2023.
//

import SwiftUI

enum ScreenState {
    case choose
    case change
    case opponentChoose
    case showOpponent
    case gameResult
}

struct SinglePlayerView: View {
    @State var screenState: ScreenState = .choose
    @State var selfChoice: Choices = .none
    @State var opponentChoice: Choices = .none
    
    var body: some View {
        switch screenState {
        case .choose:
            ChoiceView(selfChoice: $selfChoice, screenState: $screenState)
        case .change:
            ChangeChoiceView(choice: $selfChoice, screenState: $screenState)
        case .opponentChoose:
            OpponentWaitView(opponentChoice: $opponentChoice, screenState: $screenState)
        case .showOpponent:
            OpponentChoiceView(screenState: $screenState, opponentChoice: opponentChoice)
        case .gameResult:
            GameResultView(screenState: $screenState, selfChoice: $selfChoice, opponentChoice: $opponentChoice)
        }
    }
}

struct ChoiceView: View {
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

struct ChangeChoiceView: View {
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

struct OpponentWaitView: View {
    @Binding var opponentChoice: Choices
    @Binding var screenState: ScreenState
    //var result: Choices = Choices.allCases.randomElement()!
    var result: Choices = random()
    
    var body: some View {
        ZStack {
            Color.init(red: 250/255, green: 250/255, blue: 250/255)
            
            VStack {
                LabelText(text: "Your opponent is thinking")
                ZStack {
                    RoundedRectangle(cornerRadius: 48)
                        .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255))
                        .frame(height: 128)
                        .padding(.horizontal, 24)
                    Image("Vector")
                }
                .frame(width: 342, height: 128)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        opponentChoice = result
                        screenState = .showOpponent
                    }
                }
                .padding(.top, 128)
                Spacer()
            }
        }
        .ignoresSafeArea()
        .navigationTitle("Round #1")
        
    }
}

struct OpponentChoiceView: View {
    @Binding var screenState: ScreenState
    var opponentChoice: Choices
    var body: some View {
        ZStack {
            Color.init(red: 250/255, green: 250/255, blue: 250/255)
            
            VStack {
                LabelText(text: "Your opponent’s pick")
                RSPButton(icon: opponentChoice.icon)
                    .padding(.top, 128)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            screenState = .gameResult
                        }
                    }
                Spacer()
            }
        }
        .ignoresSafeArea()
        .navigationTitle("Round #1")
    }
}

struct GameResultView: View {
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
                    case .paper: LabelText(text: "Win!")
                        
                    case .rock: LabelText(text: "Lose")
                    case .scissors: LabelText(text: "Tie!")
                    case .none: LabelText(text: "Tie!")
                    }
                case .rock:
                    switch opponentChoice {
                    case .scissors: LabelText(text: "Win!")
                    case .paper: LabelText(text: "Lose")
                    case .rock: LabelText(text: "Tie!")
                    case .none: LabelText(text: "Tie!")
                    }
                case .paper:
                    switch opponentChoice {
                    case .rock: LabelText(text: "Win!")
                    case .scissors: LabelText(text: "Lose")
                    case .paper: LabelText(text: "Tie!")
                    case .none: LabelText(text: "Tie!")
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



struct RSPButton: View {
    var icon: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 48)
                .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255))
                .frame(height: 128)
                .padding(.horizontal, 24)
            Text(icon)
                .font(.system(size: 80))
        }
        .frame(width: 342, height: 128)
    }
}

struct RSPButtonMini: View {
    var icon: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 48)
                .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255))
                .frame(height: 128)
            Text(icon)
                .font(.system(size: 80))
        }
        .frame(width: 198, height: 128)
    }
}

struct LabelText: View {
    var text: String
    var body: some View {
        WinLoseText(text: text)
            .font(.system(size: 54, weight: .bold))
            .lineLimit(3)
            .truncationMode(.tail)
            .multilineTextAlignment(.center)
            .frame(width: 358)
            .padding(.top, 120)
            .padding(.bottom,12)
//        Text(text)
//            .font(.system(size: 54, weight: .bold))
//            .lineLimit(3)
//            .truncationMode(.tail)
//            .multilineTextAlignment(.center)
//            .frame(width: 358)
//            .padding(.top, 120)
//            .padding(.bottom,12)
    }
}

struct Score: View {
    var body: some View {
        Text("Score 0:0")
            .frame(width: 358, height: 22)
            .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
    }
}

struct WinLoseText: View {
    var text: String
    
    var body: some View {
        if text == "Lose" {
            Text(text)
                .background(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [Color(red: 255/255, green: 105/255, blue: 97/255), Color(red: 253/255, green: 77/255, blue: 77/255)]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        } else if text == "Tie!" {
            Text(text)
                .background(
                    LinearGradient(colors: [Color(red: 255/255, green: 204/255, blue: 0), Color(red: 255/255, green: 92/255, blue: 0)], startPoint: .leading, endPoint: .trailing)
                    )
        } else if text == "Win!" {
            Text(text)
                .background(
                    LinearGradient(colors: [Color(red: 181/255, green: 238/255, blue: 155/255), Color(red: 36/255, green: 174/255, blue: 67/255)], startPoint: .leading, endPoint: .trailing)
                    )
        } else {
            Text(text)
        }
    }
}

struct SinglePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView()
    }
}
