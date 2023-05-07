//
//  TheGoal.swift
//  WaterBalanceUI
//
//  Created by Akyl Mukatay  on 08.04.2023.
//

import SwiftUI

struct TheGoal: View {
    @State var selectedPicker: Picker = .one
    
    var body: some View {
        VStack {
            Header(text: "Water Balance", size: 24)
                .padding(.top, 64)
            Topic(text: "What is your goal?")
                .padding(.top, 46)
            ZStack {
                BgRectangle(w: 358, h: 330)
                VStack(spacing: 14) {
                    PickerList(selectedPicker: $selectedPicker, text: "Goal Number One", action: .two)
                    PickerList(selectedPicker: $selectedPicker, text: "Goal Number Two", action: .two)
                    PickerList(selectedPicker: $selectedPicker, text: "Goal Number Three", action: .two)
                    PickerList(selectedPicker: $selectedPicker, text: "Goal Number Four", action: .two)
                }
            }
            .padding(.top, 16)
            Spacer()
            CustomButton(text: "Next")
        }
    }
}


struct Header: View {
    var text: String
    var size: CGFloat
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: size, weight: .black))
                .textCase(.uppercase)
                .italic()
                .foregroundColor(Color(red: 5/255, green: 165/255, blue: 239/255))
        }
        .frame(width: 358, height: 40)
    }
}

struct Topic: View {
    var text: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 36, weight: .semibold))
                //.lineLimit(2, reservesSpace: true)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
        }
        .frame(width: 358, height: 46)
    }
}

struct BgRectangle: View {
    var w: CGFloat?
    var h: CGFloat?
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: w, height: h)
                .foregroundColor(Color(red: 212/255, green: 225/255, blue: 248/255))
        }
    }
}

struct CustomButton: View {
    var text: String
    
    var body: some View {
        Button(action: {}) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                Text(text)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
            }
            .frame(width: 358, height: 60)
        }

    }
}

enum Picker: Int {
    case one = 1
    case two = 0
}

struct PickerList: View {
    @Binding var selectedPicker: Picker
    
    var text: String
    var action: Picker
    
    var body: some View {
        Button(action: {selectedPicker = action}) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.white)
                HStack(spacing: 14) {
                    Text(text)
                        .frame(width: 234, height: 28, alignment: .leading)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                        
                    ZStack {
                        Image("Ellipse 1")
                        if selectedPicker == action {
                            Image("Ellipse 2")
                        }
                    }
                }
                
            }
            .frame(width: 320, height: 60)
        }
    }
}

struct TheGoal_Previews: PreviewProvider {
    static var previews: some View {
        TheGoal()
    }
}
