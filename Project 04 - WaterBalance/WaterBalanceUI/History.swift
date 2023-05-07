//
//  History.swift
//  WaterBalanceUI
//
//  Created by Akyl Mukatay  on 08.04.2023.
//

import SwiftUI

struct History: View {
    var body: some View {
        VStack {
            Header(text: "History", size: 17)
            ScrollView {
                section1
                    .padding(.bottom, 31)
                section2
            }
        }
    }
    
    var section1: some View {
        VStack {
            listHeader(text: "Today")
            customList(text: "250 ml", time: "12:13")
            customList(text: "200 ml", time: "14:10")
            customList(text: "50 ml", time: "15:13")
            customList(text: "300 ml", time: "19:10")
        }
    }
    
    var section2: some View {
        VStack {
            listHeader(text: "23:11:21")
            customList(text: "250 ml", time: "12:13")
            customList(text: "200 ml", time: "14:10")
            customList(text: "50 ml", time: "15:13")
            customList(text: "300 ml", time: "19:10")        }
    }
    
    func listHeader(text: String) -> some View {
        HStack {
            Text(text)
                .font(.system(size: 20, weight: .semibold))
                .padding(.bottom, 10)
            Spacer()
        }
        .frame(width: 358, height: 26)
        .padding(.top, 21)
    }
    
    func customList(text: String, time: String) -> some View {
        VStack {
            HStack {
                Text(text)
                    .frame(width: 309, height: 22, alignment: .leading)
                Text(time)
                    .foregroundColor(.gray)
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

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
