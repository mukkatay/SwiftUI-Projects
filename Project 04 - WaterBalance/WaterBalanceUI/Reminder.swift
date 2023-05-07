//
//  Reminder.swift
//  WaterBalanceUI
//
//  Created by Akyl Mukatay  on 08.04.2023.
//

import SwiftUI

struct Reminder: View {
    var body: some View {
        VStack {
            GoBack()
            Header(text: "Water Balance", size: 24)
                .padding(.top, 4)
            Topic(text: "Remind me each")
                .padding(.top, 46)
            ZStack {
                BgRectangle(w: 358, h: 330)
                VStack() {
                    CustomGrid()
                }
            }
            .padding(.top, 16)
            Spacer()
            CustomButton(text: "Next")
        }
    }
}

struct CustomGrid: View {
    var body: some View {
        Grid(horizontalSpacing: 14, verticalSpacing: 14) {
            GridRow {
                gridButton(text: "15 minutes")
                gridButton(text: "30 minutes")
            }
            GridRow {
                gridButton(text: "45 minutes")
                gridButton(text: "1 hour")
            }
            GridRow {
                gridButton(text: "1,5 hours")
                gridButton(text: "2 hour")
            }
            GridRow {
                gridButton(text: "3 hour")
                gridButton(text: "4 hour")
            }
        }
    }
    
    func gridButton(text: String) -> some View {
        Button(action: {}) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.white)
                Text(text)
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
            }
            .frame(width: 150, height: 60)
        }
    }
}

struct GoBack: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image("left")
                    .padding(.leading, 16)
            }
            Spacer()
        }
        .frame(width: 390, height: 42)
    }
}

struct Reminder_Previews: PreviewProvider {
    static var previews: some View {
        Reminder()
    }
}
