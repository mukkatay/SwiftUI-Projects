//
//  Settings.swift
//  WaterBalanceUI
//
//  Created by Akyl Mukatay  on 08.04.2023.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        VStack {
            Header(text: "Edit", size: 17)
            ScrollView {
                customList(text: "Daily Intake Level", ml: "2400 ML")
                    .padding(.top, 21)
                customList(text: "Your goal", ml: "")
                customList(text: "Reminder", ml: "")
            }
            Spacer()
        }
    }
    func customList(text: String, ml: String) -> some View {
        VStack {
            Button(action: {}) {
                HStack {
                    Text(text)
                        .frame(width: 258, height: 22, alignment: .leading)
                        .foregroundColor(.black)
                    Text(ml)
                        .foregroundColor(.gray)
                        .frame(width: 70, height: 22)
                    Image("right")
                        .padding(.leading, 12)
                }
            }
            Rectangle()
                .frame(width: 374, height: 1)
                .foregroundColor(Color(red: 198/255, green: 198/255, blue: 200/255))
                .opacity(0.1)
                .padding(.leading, 16)
            
        }
        .padding(.top, 3)
        .padding(.bottom, 7)
        
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
