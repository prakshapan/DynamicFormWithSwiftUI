//
//  BackgroundView.swift
//  JobLogins
//
//  Created by Praks on 7/16/20.
//

import SwiftUI
struct BackgroundView: View {
    var image: Image
    var body: some View {
        image.resizable(capInsets: EdgeInsets(),
            resizingMode: .stretch)
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
    }
}




