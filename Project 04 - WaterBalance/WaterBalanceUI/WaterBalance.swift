//
//  WaterBalance.swift
//  WaterBalanceUI
//
//  Created by Akyl Mukatay  on 08.04.2023.
//

import SwiftUI

struct WaterBalance: View {
    var body: some View {
        VStack {
            Header(text: "Water Balance", size: 17)
            mainCircle
                .padding(.top, 24)
            Topic(text: "Add your first drink for today")
                .padding(.top, 32)
            Spacer()
            CustomButton(text: "Add")
        }
    }
    
    var mainCircle: some View {
        ZStack {
            gradientRect
            VStack {
                ZStack {
                    Circle()
                        .stroke(.white, lineWidth: 6)
                        .frame(width: 180, height: 180)
                    VStack {
                        Text("0 %")
                            .font(.system(size: 36, weight: .bold))
                        Text("0 out of 2,4 L")
                            .padding(0)
                    }
                }
                
                Text("Monday, 25th of November")
                    .padding(.top, 58)
            }
        }
    }
    
    var gradientRect: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 212/255, green: 225/255, blue: 248/255), .white]), startPoint: .top, endPoint: .bottom))
            .frame(width: 358, height: 332)
    }
}

struct WaterBalance_Previews: PreviewProvider {
    static var previews: some View {
        WaterBalance()
    }
}
