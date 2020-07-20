//
//  LodgeTaxReturnView.swift
//  JobLogins
//
//  Created by Praks on 7/18/20.
//

import SwiftUI
struct LodgeTaxReturnView: View {
    @Environment(\.presentationMode) var presentationMode

    @State var tableFields: ObservableArray<FormElement> = ObservableArray(array: [
        FormElement(title: AppString.firstName,
            validate: [
                ValidateRule(rule: Regex.mustContain, error: ErrorMessage.enter(AppString.firstName))]),
        FormElement(title: AppString.lastName,
            validate: [
                ValidateRule(rule: Regex.mustContain, error: ErrorMessage.enter(AppString.lastName))]),

        FormElement(title: AppString.dob,
            validate: [
                ValidateRule(rule: Regex.mustContain, error: ErrorMessage.enter(AppString.password))
            ], type: .date),

        FormElement(title: AppString.taxFileNumber,
            validate: [
                ValidateRule(rule: Regex.mustContain, error: ErrorMessage.enter(AppString.address))
            ]),
        FormElement(title: AppString.address,
            validate: [
                ValidateRule(rule: Regex.mustContain, error: ErrorMessage.enter(AppString.address))
            ]),
        FormElement(title: AppString.city,
            validate: [
                ValidateRule(rule: Regex.mustContain, error: ErrorMessage.enter(AppString.city))
            ]),
        FormElement(title: AppString.state,
            validate: [
                ValidateRule(rule: Regex.mustContain, error: ErrorMessage.enter(AppString.state))
            ]),
        FormElement(title: AppString.postcode,
            validate: [
                ValidateRule(rule: Regex.mustContain, error: ErrorMessage.enter(AppString.postcode))
            ], keyboard: .numberPad),
        FormElement(title: AppString.financialYear,
            pickerValues: ["2020-19", "2019-18", "2018-17", "Before 2017"],
            validate: [
                ValidateRule(rule: Regex.mustContain, error: ErrorMessage.enter(AppString.financialYear))
            ], type: .picker),
        FormElement(title: AppString.bankAccountForRefund,
            validate: [
                ValidateRule(rule: Regex.mustContain, error: ErrorMessage.enter(AppString.bankAccount))
            ], placeHolder: AppString.bankAccount),
        FormElement(title: AppString.bankAccountNumberForRefund,
            validate: [
                ValidateRule(rule: Regex.mustContain, error: ErrorMessage.enter(AppString.accountNumber))
            ], placeHolder: AppString.accountNumber),
        ])
    @State var selectedValue : String = ""

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text(self.selectedValue).foregroundColor(.blue)
                TitleAndBackView(title: "Lodge Tax Return", color: .textfieldTitleColor)
                    .padding(.bottom, 30)
                ForEach(tableFields.array) { element in
                    switch element.type {
                    case .date: Datefield(field: element)
                    case .picker: Pickerfield(field: element)
                    default: AppTextfield(field: element)
                    }
                }
                Spacer()
                Button("Submitted") {
                    print(self.tableFields.array.map(\.value))
                }
            }
        }.padding(.all, 20)
        .navigationBarHidden(true)
        .keyboardObserving()
        .onTapGesture { self.dismissKeyboard() }
    }
}

struct LodgeTaxReturnView_Previews: PreviewProvider {
    static var previews: some View {
        LodgeTaxReturnView()
    }
}

