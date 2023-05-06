//
//  ContentView.swift
//  BerlinClockApp
//
//  Created by Akyl Mukatay  on 11.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
    @State private var hours = 0
    @State private var minutes = 0
    
    var body: some View {
        let redCountFive = hours / 5
        let redCountOne = hours % 5
        let fiveMinutesCount = minutes / 5
        let singleMinutesCount = minutes % 5
        
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 242/255, green: 242/255, blue: 238/255))
                .ignoresSafeArea()
            
            VStack {
                topTimer
                
                VStack(spacing: 16) {
                    HStack {
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(height: 56)
                    }
                    
                    HStack {
                        ForEach(0..<4) { i in
                            RoundedRectangle(cornerRadius: 4)
                                .foregroundColor(i < redCountFive ? .red : CustomColors.dullRed)
                        }
                    }
                    .frame(height: 32)
                    HStack {
                        ForEach(0..<4) { i in
                            RoundedRectangle(cornerRadius: 4)
                                .foregroundColor(i < redCountOne ? .red : CustomColors.dullRed)
                        }
                    }
                    .frame(height: 32)
                    HStack {
                        ForEach(0..<11) { i in
                            RoundedRectangle(cornerRadius: 4)
                                .foregroundColor(i < fiveMinutesCount ? (i != 0 && (i+1) % 3 == 0 ? .red : .yellow) : ((i+1) % 3 == 0 ? CustomColors.dullRed : CustomColors.dullYellow))
                        }
                    }
                    .frame(height: 32)
                    HStack {
                        ForEach(0..<4) { i in
                            RoundedRectangle(cornerRadius: 4)
                                .foregroundColor(i < singleMinutesCount ? .yellow : CustomColors.dullYellow)
                        }
                    }
                    .frame(height: 32)
                }
                .padding()
                .frame(width: 358, height: 312)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                
                selectTime
                Spacer()
                
            }
        }
        
    }
    
    var topTimer: some View {
        HStack {
            Text("Time is \(selectedDate.formatted(date: .omitted, time: .standard))")
        }
        .padding(.top)
        .padding(.bottom, 20)
        .fontWeight(.semibold)
    }
    
    var selectTime: some View {
        HStack {
            DatePicker(selection: $selectedDate, displayedComponents: .hourAndMinute) {
                Text("Select a date")
                    .fontWeight(.medium)
            }
            .environment(\.locale, Locale(identifier: "kz_KZ"))
            .datePickerStyle(.compact)
            .padding(.horizontal, 16)
            .onReceive([self.selectedDate].publisher.first()) { _ in
                let calendar = Calendar.current
                let components = calendar.dateComponents([.hour, .minute], from: selectedDate)
                hours = components.hour ?? 0
                minutes = components.minute ?? 0
                print("Selected hours: \(hours)")
                print("Selected hours: \(minutes)")
            }
        }
        .frame(width: 358, height: 54)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray, radius: 5, x: 0, y: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
