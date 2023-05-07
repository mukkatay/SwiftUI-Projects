//
//  Water.swift
//  WaterBalanceUI
//
//  Created by Akyl Mukatay  on 08.04.2023.
//

import SwiftUI

struct Water: View {
    @State
    private var textFieldMl = ""
    
    var body: some View {
        VStack {
            GoBack()
            Header(text: "Water Balance", size: 24)
                .padding(.top, 4)
            Topic(text: "Daily intake?")
                .padding(.top, 46)
            ZStack {
                BgRectangle(w: 358, h: 108)
                dailyIntake
            }
            .padding(.top, 16)
            Spacer()
            CustomButton(text: "Save")
        }
    }
    
    var dailyIntake: some View {
        HStack(spacing: 12) {
            TextField("1000", text: $textFieldMl)
                .multilineTextAlignment(.center)
                .foregroundColor(.blue)
                .frame(width: 250, height: 60)
                .background(Color.white)
                .cornerRadius(16)
            Text("ML")
        }
        .font(.system(size: 16, weight: .medium))
    }
}

struct Water_Previews: PreviewProvider {
    static var previews: some View {
        Water()
    }
}
