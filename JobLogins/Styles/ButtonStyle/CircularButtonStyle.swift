//
//  CircularButtonStyle.swift
//  JobLogins
//
//  Created by Praks on 7/16/20.
//

import SwiftUI

struct CircleButtonStyle: ButtonStyle {
    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        Circle().fill().overlay(
            Circle()
                .fill(RadialGradient(gradient: Gradient(colors: [.black, .white]), center: .center, startRadius: 0, endRadius: 125))
        )
            .overlay(
                configuration.label
                    .foregroundColor(.white)
                    .background(Image.init(systemName: "arrow.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30)))
            )
            .frame(width: 75, height: 75)
    }
}
