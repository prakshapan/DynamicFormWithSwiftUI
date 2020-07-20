//
//  TitleView.swift
//  JobLogins
//
//  Created by Praks on 7/16/20.
//

import SwiftUI
struct TitleView: View {
    var title: String
    var color: Color = .white
    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text(title).lineLimit(3)
            }.font(.system(size: 34,
                weight: .bold,
                design: .rounded))
                .foregroundColor(color)
        }
    }
}

struct TitleAndBackView: View {
    @Environment(\.presentationMode) var presentationMode
    var title: String
    var color: Color = .white
    var body: some View {
        VStack(alignment: .leading) {
            closeButton
            titleView
        }
    }
    var titleView: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text(title).lineLimit(3)
            }.font(.system(size: 34,
                weight: .bold,
                design: .rounded))
                .foregroundColor(color)
        }
    }
    
    var closeButton: some View {
        HStack() {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                    Image.back
                        .frame(width: 30, height: 30)
                        .foregroundColor(color)
                })
            Spacer()
        }
    }
}

