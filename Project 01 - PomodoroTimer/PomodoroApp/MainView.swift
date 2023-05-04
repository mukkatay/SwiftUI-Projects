//
//  Main.swift
//  PomodoroApp
//
//  Created by Akyl Mukatay  on 20.04.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            bgImage
            VStack {
                FocusCategoryButton()
                CustomTimer()
                Spacer()
            }
            .frame(height: 844)
        }
    }
    
    var bgImage: some View {
        Image("BG")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 880)
            .ignoresSafeArea()
    }
}
//------------------------------FocusCategoryButton------------------------------------
struct FocusCategoryButton: View {
    @State var showingSheet = false
    
    var body: some View {
        Button {
            showingSheet.toggle()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .foregroundColor(.white)
                    .opacity(0.4)
                HStack {
                    Image("Vector")
                    Text("Focus Category")
                        .foregroundColor(.white)
                }
            }
        }
        .frame(width: 170, height: 36)
        .padding(.top, 114)
        .padding(.bottom, 36)
        .sheet(isPresented: $showingSheet) {
            FocusCategoryChangeView(showingSheet: $showingSheet)
                .presentationDetents([.height(346)])
                .edgesIgnoringSafeArea(.all)
        }
    }
}

//------------------------------CustomTimer------------------------------------
struct CustomTimer: View {
    @State var start = false
    @State var stop = 0
    @State var counter = 0
    @State var countTo = 120
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            ZStack {
                progressCircle
                myClock
            }
            .frame(width: 248, height: 248)
            .foregroundColor(.white)
            
            HStack(spacing: 80) {
                Button {
                    if self.countTo == 0{
                        self.countTo = 120
                        withAnimation(.default){
                            self.counter = 0
                        }
                    }
                    
                    self.start.toggle()
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 56, height: 56)
                            .foregroundColor(.white)
                            .opacity(0.4)
                        Image(self.start ? "Pause" : "Union")
                            .foregroundColor(.white)
                    }
                }
                
                Button {
                    if self.start && self.stop > 0 {
                        self.countTo = 120
                        withAnimation(.default) {
                            self.counter = 0
                        }
                        self.start.toggle()
                        self.stop = 0
                    } else if !self.start && self.stop > 0 {
                        self.countTo = 120
                        withAnimation(.default) {
                            self.counter = 0
                        }
                        self.stop = 0
                    }
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 56, height: 56)
                            .foregroundColor(.white)
                            .opacity(0.4)
                        Image("Stop")
                    }
                }
            }
            .frame(width: 192, height: 56)
            .padding(.top, 44)
            
        }
        .onReceive(timer) { time in
            if self.start {
                stop += 1
                if (self.counter < self.countTo) {
                    self.counter += 1
                }
            }
        }
    }
    
    var progressCircle: some View {
        ZStack {
            Circle()
                .stroke(.white, lineWidth: 6)
                .opacity(0.3)
            Circle()
                .trim(from: 0, to: progress())
                .stroke(.white, lineWidth: 6)
                .rotationEffect(Angle(degrees: -90))
        }
    }
    
    var myClock: some View {
        VStack {
            Text(counterToMinutes())
                .font(.system(size: 44, weight: .bold))
                .padding(.bottom, 4)
            Text("Focus on your task")
        }
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
    
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        
        return "\(minutes < 10 ? "0" : "")\(minutes):\(seconds < 10 ? "0" : "")\(seconds) "
    }
    
}





struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
