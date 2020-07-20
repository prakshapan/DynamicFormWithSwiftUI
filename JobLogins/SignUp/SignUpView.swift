//
//  SignUpView.swift
//  JobLogins
//
//  Created by Praks on 7/16/20.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode

    @State var tableFields: ObservableArray<FormElement> = ObservableArray(array: [
        FormElement(title: AppString.firstName, value: "",
            validate: [
                ValidateRule(rule: Regex.mustContain, error: ErrorMessage.enter(AppString.firstName))]),
        FormElement(title: AppString.lastName, value: "",
            validate: [
                ValidateRule(rule: Regex.mustContain, error: ErrorMessage.enter(AppString.lastName))]),

        FormElement(title: AppString.password, value: "",
            validate: [
                ValidateRule(rule: Regex.mustContain, error: ErrorMessage.enter(AppString.password))
            ]),

        FormElement(title: AppString.email, value: "",
            validate: [
                ValidateRule(rule: Regex.mustContain, error: ErrorMessage.enter(AppString.email)),
                ValidateRule(rule: Regex.email, error: ErrorMessage.valid(AppString.email))
            ]),
        FormElement(title: AppString.address, value: "",
            validate: [
                ValidateRule(rule: Regex.mustContain, error: ErrorMessage.enter(AppString.address))
            ]),
        FormElement(title: AppString.phoneNumber, value: "",
            validate: [
                ValidateRule(rule: Regex.mustContain, error: ErrorMessage.enter(AppString.phoneNumber)),
                ValidateRule(rule: Regex.numbersOnly, error: ErrorMessage.valid(AppString.phoneNumber))
            ]),
        ])

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                closeButton
                TitleView(title: "Create \nAccount")
                ForEach(tableFields.array) { element in
                    CustomTextField(field: element, placeHolderColor: Color.white.opacity(0.55))
                }
                Spacer()
                signUp
            }
        }.padding(.all, 20)
            .navigationBarHidden(true)
            .background(BackgroundView(image: Image.signupBackground))
    }

    var closeButton: some View {
        HStack() {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                    Image.back
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                })
            Spacer()
        }
    }

    var signUp: some View {
        HStack() {
            Text("Sign Up")
                .font(.system(size: 30, weight: .bold,
                    design: .rounded))
                .foregroundColor(.white)
            Spacer()
            Button(action: {
                print(Validity.check(for: self.tableFields.array))
            }, label: { }).buttonStyle(CircleButtonStyle())
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

import SwiftUI
import Combine

struct CustomTextField: View {
    @ObservedObject var field: FormElement
    @State var cancellable: AnyCancellable? = nil
    var placeHolderColor = Color.gray

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                if field.value.isEmpty {
                    Text(field.title)
                        .font(.system(size: 16,
                            weight: .light,
                            design: .default))
                        .foregroundColor(placeHolderColor)
                }
                TextField("", text: $field.value).textFieldStyle(BottomLineTextFieldStyle(textColor: .white))
            }
            Text(field.errorMessage ?? "")
                .font(.footnote)
                .foregroundColor(.red)
        }
    }

    func validate() {
        self.cancellable = self.field.$value.sink { (value) in
            self.field.objectWillChange.send()
            guard !field.value.isEmpty else {
                field.errorMessage = ""
                return
            }
            for ruleError in field.validate {
                if field.value ~= ruleError.rule {
                    field.errorMessage = ""
                } else {
                    field.errorMessage = ruleError.error
                }
            }
        }
    }

}


