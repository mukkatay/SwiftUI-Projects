//
//  BookmarkListView.swift
//  BookmarkApp
//
//  Created by Akyl Mukatay  on 18.04.2023.
//

import SwiftUI

struct BookmarkListView: View {
    @State var showingSheet = false
    @State var nameAndLink: [String: String] = [:]
    
    var body: some View {
        VStack {
            if nameAndLink.isEmpty {
                emptyBookmarkList
            } else {
                bookmarkList
            }
            
//            Button {
//                UserDefaults.standard.set(false, forKey: "isWelcomeSeen")
//            } label: {
//                RoundedRectangle(cornerRadius: 16)
//                    .frame(width: 100, height: 50)
//            }

            
            Button {
                showingSheet.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 358, height: 58)
                        .foregroundColor(Colors.primaryButton.value)
                    Text("Add bookmark")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                }
                .padding(.bottom, 50)
            }
            .sheet(isPresented: $showingSheet) {
                BookmarkAddView(showSheet: $showingSheet, nameAndLink: $nameAndLink)
                    .presentationDetents([.height(362)])
                    //.presentationDragIndicator(.visible)
                    .edgesIgnoringSafeArea(.all)
            }

        }
        .ignoresSafeArea()
    }
    
    var emptyBookmarkList: some View {
        VStack {
            Text("Bookmark App")
                .font(.system(size: 17, weight: .semibold))
                .frame(width: 390, height: 60)
                .padding(.top, 45)
            
            Spacer()
            
            Text("Save your first \nbookmark")
                .font(.system(size: 36, weight: .bold))
                .frame(width: 358, height: 92)
                .multilineTextAlignment(.center)
                .padding(.bottom, 282)
        }
    }
    
    var bookmarkList: some View {
        VStack {
            Text("List")
                .font(.system(size: 17, weight: .semibold))
                .frame(width: 390, height: 60)
                .padding(.top, 45)
            ScrollView {
                ForEach(nameAndLink.sorted(by: {$0.0<$1.0}), id: \.0) { title, link in
                    let websiteUrl = URL(string: link)!
                    HStack {
                        Text(title)
                        Spacer()
                        Button {
                            UIApplication.shared.open(websiteUrl)
                        } label: {
                            Image("Link")
                        }
                        
                    }
                    .padding(EdgeInsets(top: 23, leading: 16, bottom: 5, trailing: 16))
                    Rectangle()
                        .frame(width: 374, height: 1)
                        .foregroundColor(Colors.line.value)
                        .padding(.leading, 16)
                }
            }
            Spacer()
        }
    }
}


struct BookmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkListView()
    }
}
