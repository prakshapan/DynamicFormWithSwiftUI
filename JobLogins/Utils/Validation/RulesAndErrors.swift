//
//  RulesAndErrors.swift
//  JobLogins
//
//  Created by Praks on 7/17/20.
//

import Foundation

struct ValidateRule {
    var rule: String
    var error: String
}

struct Regex {
    static let mustContain = "^(\\s|\\S)*(\\S)+(\\s|\\S)*$"
    static let mustContainAlphaNum = "^[a-zA-Z0-9 ]{1,}$"
    static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let password = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
    static let cvv = "^[0-9]{3,4}$"
    static let numbersOnly = "^[0-9]{1,}$"
    static let mustContainAlphabet = "^[a-zA-Z]{1,}$"
    static let routing = "([012346789][0-9]{8}$)\\b(?<!026009593)"
}

struct ErrorMessage {
    static func valid(_ message: String) -> String {
        return "Please enter valid " + message + "."
    }
    
    static func enter(_ message: String) -> String {
        return "Please enter " + message.lowercased() + "."
    }
}
