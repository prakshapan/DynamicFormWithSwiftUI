//
//  TransitionExtension.swift
//  JobLogins
//
//  Created by Praks on 7/18/20.
//

import SwiftUI
extension AnyTransition {
    static var moveAndScale: AnyTransition {
        AnyTransition.move(edge: .bottom).combined(with: .scale)
    }
}
