//
//  FocusCategoryChangeView.swift
//  PomodoroApp
//
//  Created by Akyl Mukatay  on 20.04.2023.
//

import SwiftUI

struct FocusCategoryChangeView: View {
    @Binding var showingSheet: Bool
    
    var body: some View {
        VStack {
            header
            Grid {
                GridRow {
                    CustomButton(text: "Work")
                    CustomButton(text: "Study")
                }
                GridRow {
                    CustomActiveButton(text: "Workout")
                    CustomButton(text: "Reading")
                }
                GridRow {
                    CustomButton(text: "Meditation")
                    CustomButton(text: "Others")
                }
            }
            .frame(height: 220)
            .padding(.top, 40)
        }
    }
    
    var header: some View {
        HStack {
            Spacer()
            Text("Focus Category")
                .fontWeight(.medium)
            Button(action: {showingSheet.toggle()}) {
                Image("Close")
                    
            }
            .padding(.leading, 95)
            .padding(.trailing, 21)
        }
        .frame(width: 390)
    }
}

struct CustomButton: View {
    var text: String
    
    var body: some View {
        Button(action: {}) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 172, height: 60)
                    .foregroundColor(Color(red: 234/255, green: 234/255, blue: 234/255))
                    .padding(4)
                Text(text)
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
            }
        }
    }
}

struct CustomActiveButton: View {
    var text: String
    
    var body: some View {
        Button(action: {}) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 172, height: 60)
                    .foregroundColor(Color(red: 47/255, green: 47/255, blue: 51/255))
                    .padding(4)
                Text(text)
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
            }
        }
    }
}

struct FocusCategoryChangeView_Previews: PreviewProvider {
    static var previews: some View {
        FocusCategoryChangeView(showingSheet: .constant(true))
    }
}
