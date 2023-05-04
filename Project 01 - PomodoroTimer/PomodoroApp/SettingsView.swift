//
//  SettingView.swift
//  PomodoroApp
//
//  Created by Akyl Mukatay  on 20.04.2023.
//

import SwiftUI

struct SettingsView: View {
    @State private var textFieldTime = ""
    @State private var textFieldTime2 = ""
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
            VStack {
                CustomLabel(label: "Settings")
                ScrollView {
                    CustomList(text: "Focus time", textFieldDefault: "25:00", textFieldText: $textFieldTime)
                    CustomList(text: "Break time", textFieldDefault: "5:00", textFieldText: $textFieldTime2)
                }
                Spacer()
            }
            .padding(.top, 56)
            
        }
        .ignoresSafeArea()
    }
}

struct CustomLabel: View {
    var label: String
    
    var body: some View {
        Text(label)
            .foregroundColor(.white)
            .font(.system(size: 17, weight: .semibold))
            .padding(.bottom, 18)
    }
}

struct CustomList: View {
    
    
    var text: String
    var textFieldDefault: String
    var textFieldText: Binding<String>
    
    var body: some View {
        
        
        VStack {
            HStack {
                Text(text)
                    .foregroundColor(.white)
                TextField(textFieldDefault, text: textFieldText)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.trailing)
                    .padding(.trailing, 16)
            }
            Rectangle()
                .frame(width: 374, height: 1)
                .foregroundColor(Color(red: 56/255, green: 56/255, blue: 58/255))
                
        }
        .padding(.leading, 16)
    }
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
