//
//  TextfieldElement.swift
//  JobLogins
//
//  Created by Praks on 7/17/20.
//

import UIKit
import Combine

class FormElement: ObservableObject, Identifiable {
    var id = UUID()
    var title = ""
    var placeHolder = ""
    @Published var value = ""
    var pickerValues: [String] = []
    var validate: [ValidateRule] = []
    var hasError = false
    @Published var errorMessage = ""
    var type: FormType = .text
    var keyboard: UIKeyboardType = .asciiCapable
    var returnType: UIReturnKeyType = .next

    init(title: String, value: String = "", pickerValues: [String] = [], validate: [ValidateRule], placeHolder: String = "", type: FormType = .text, keyboard: UIKeyboardType = .asciiCapable) {
        self.title = title
        self.value = value
        self.pickerValues = pickerValues
        self.validate = validate
        self.placeHolder = placeHolder
        self.type = type
        self.keyboard = keyboard
    }
}

enum FormType {
    case text, picker, toggle, date
}
