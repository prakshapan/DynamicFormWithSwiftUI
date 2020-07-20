//
//  ButtomTextfieldStyle.swift
//  JobLogins
//
//  Created by Praks on 7/16/20.
//

import SwiftUI

struct BottomLineTextFieldStyle: TextFieldStyle {
    var underlineColor = Color.gray
    var textColor = Color.black
    var image: Image?
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack() {
            HStack() {
                configuration
                    .font(.system(size: 16, weight: .semibold,
                        design: .default))
                    .foregroundColor(textColor)
                    .padding(.vertical, 4)
                Spacer()
                image.map { $0
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .padding(.all, 4)
                }
            }
            Rectangle()
                .frame(height: 1, alignment: .bottom)
                .foregroundColor(underlineColor)
        }
    }
}
