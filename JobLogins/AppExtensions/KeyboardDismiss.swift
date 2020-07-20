//
//  KeyboardDismiss.swift
//  JobLogins
//
//  Created by Praks on 7/19/20.
//

import SwiftUI
#if canImport(UIKit)
extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
