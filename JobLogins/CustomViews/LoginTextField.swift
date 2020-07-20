//
//  LoginTextfield.swift
//  JobLogins
//
//  Created by Praks on 7/16/20.
//

import SwiftUI
struct LoginTextField: View {
    var placeHolder: String
    var placeHolderColor = Color.gray.opacity(0.65)
    @Binding var text: String
    @Binding var errorText: String?

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeHolder)
                        .font(.system(size: 16,
                                      weight: .semibold,
                            design: .monospaced))
                        .foregroundColor(placeHolderColor)
                }
                TextField("", text: $text).textFieldStyle(BottomLineTextFieldStyle())
            }
        }

        Text(errorText ?? "")
            .font(.footnote)
            .foregroundColor(.red)
    }
}
