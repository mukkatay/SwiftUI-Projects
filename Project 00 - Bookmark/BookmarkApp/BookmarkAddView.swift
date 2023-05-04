//
//  BookmarkAddView.swift
//  BookmarkApp
//
//  Created by Akyl Mukatay  on 19.04.2023.
//

import SwiftUI

struct BookmarkAddView: View {
    @State var titleText = ""
    @State var linkText = ""
    @Binding var showSheet: Bool
    @Binding var nameAndLink: [String: String]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    showSheet.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.trailing, 22)
                        .padding(.top, 22)
                }

            }
            VStack {
                HStack {
                    Text("Title")
                        .padding(.top, 22)
                    Spacer()
                }
                TextField("Bookmark title", text: $titleText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .frame(width: 358)
            
            VStack {
                HStack {
                    Text("Link")
                        .padding(.top, 16)
                    Spacer()
                }
                TextField("Bookmark link (URL)", text: $linkText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .frame(width: 358)
            
            Spacer()
            
            Button {
                nameAndLink[titleText] = linkText
                titleText = ""
                linkText = ""
                showSheet.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 358, height: 58)
                        .foregroundColor(Colors.primaryButton.value)
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                }
                .padding(.bottom, 50)
            }
        }
        
    }
}

//struct BookmarkAddView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookmarkAddView(showSheet: .constant(true))
//    }
//}
