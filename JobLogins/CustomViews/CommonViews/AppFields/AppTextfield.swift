//
//  AppTextfield.swift
//  JobLogins
//
//  Created by Praks on 7/18/20.
//

import SwiftUI

struct AppTextfield: View {
    @ObservedObject var field: FormElement
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Appfield(field).title
            ZStack(alignment: .leading) {
                if field.value.isEmpty { Appfield(field).placeHolder }
                Appfield(field).valueAndBorder
            }
            Appfield(field).errorMessage
        }.padding(.bottom, 8)
    }
}

struct AppTextfield_Previews: PreviewProvider {
    static var previews: some View {
        AppTextfield(field: FormElement(title: "Name", value: "", validate: [ValidateRule(rule: Regex.mustContain, error: "The value is empty")]))
            .padding()
    }
}
