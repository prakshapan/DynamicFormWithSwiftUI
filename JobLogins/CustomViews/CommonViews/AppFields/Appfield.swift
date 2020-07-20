//
//  Appfield.swift
//  JobLogins
//
//  Created by Praks on 7/20/20.
//

import SwiftUI

struct Appfield {
    var placeHolderColor = Color.gray.opacity(0.7)
    @ObservedObject var field: FormElement

    init(_ field: FormElement) {
        self.field = field
    }

    var title: some View {
        Text(field.title)
            .font(.system(size: 12,
                weight: .regular,
                design: .default))
            .foregroundColor(.textfieldTitleColor)
    }

    var placeHolder: some View {
        Text(!field.placeHolder.isEmpty ? field.placeHolder : field.title)
            .font(.system(size: 16,
                weight: .light,
                design: .default))
            .foregroundColor(placeHolderColor)
    }

    var errorMessage: some View {
        Text(field.errorMessage)
            .font(.footnote)
            .foregroundColor(.red)
    }

    var valueAndBorder: some View {
        TextField("", text: $field.value).textFieldStyle(BottomLineTextFieldStyle(textColor: .textfieldTitleColor))
            .keyboardType(field.keyboard)
            .disableAutocorrection(true)
    }

    var valueAndBorderUneditable: some View {
        TextField("", text: $field.value).textFieldStyle(BottomLineTextFieldStyle(textColor: .textfieldTitleColor, image: .disclose)).disabled(true)
    }
}
