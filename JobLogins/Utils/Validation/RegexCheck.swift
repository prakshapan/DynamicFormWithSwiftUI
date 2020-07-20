//
//  Validation.swift
//  JobLogins
//
//  Created by Praks on 7/16/20.
//
import Foundation

struct Validity {
    static func check(for textfields: [FormElement]) -> Bool {
        var hasNoError = true
        for field in textfields {
            for validityRule in field.validate {
                if !(field.value ~= validityRule.rule) {
                    hasNoError = false
                    field.errorMessage = validityRule.error
                    break
                } else {
                    field.errorMessage = ""
                }
            }
        }
        return hasNoError
    }
}

extension String {
    static func ~= (lhs: String, rhs: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: rhs) else { return false }
        let range = NSRange(location: 0, length: lhs.utf16.count)
        return regex.firstMatch(in: lhs, options: [], range: range) != nil
    }
}


extension NSRegularExpression {
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }

    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}
