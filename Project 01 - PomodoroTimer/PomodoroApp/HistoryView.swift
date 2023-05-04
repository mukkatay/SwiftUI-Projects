//
//  HistoryView.swift
//  PomodoroApp
//
//  Created by Akyl Mukatay  on 20.04.2023.
//

import SwiftUI

struct HistoryView: View {
    @State private var textFieldTime = ""
    @State private var textFieldTime2 = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
            VStack {
                CustomLabel(label: "History")
                ScrollView {
                    VStack(alignment: .leading) {
                        CustomHeader(text: "21.11.21")
                        CustomList(text: "Focus time", textFieldDefault: "01:28:32", textFieldText: $textFieldTime)
                        CustomList(text: "Break time", textFieldDefault: "5:00", textFieldText: $textFieldTime2)
                    }
                    .padding(.bottom, 16)
                    VStack(alignment: .leading) {
                        CustomHeader(text: "20.11.21")
                        CustomList(text: "Focus time", textFieldDefault: "25:00", textFieldText: $textFieldTime)
                        CustomList(text: "Break time", textFieldDefault: "5:00", textFieldText: $textFieldTime2)
                    }
                    .padding(.bottom, 16)
                    VStack(alignment: .leading) {
                        CustomHeader(text: "19.11.21")
                        CustomList(text: "Focus time", textFieldDefault: "25:00", textFieldText: $textFieldTime)
                        CustomList(text: "Break time", textFieldDefault: "5:00", textFieldText: $textFieldTime2)
                    }
                    .padding(.bottom, 16)
                }
            }
            .padding(.top, 56)
        }
        .ignoresSafeArea()
    }
}

struct CustomHeader: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding(.leading, 16)
            .font(.system(size: 20, weight: .semibold))
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
