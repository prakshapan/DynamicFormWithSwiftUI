//
//  SigIn+SubViews.swift
//  JobLogins
//
//  Created by Praks on 7/16/20.
//

import SwiftUI
extension SignInView {

    var fields: some View {
        VStack(alignment: .leading) {
            LoginTextField(placeHolder: "Username",
                text: $username,
                errorText: $usernameError)
            LoginTextField(placeHolder: "Password",
                text: $password,
                errorText: $passwordError)
        }
    }

    var signinButton: some View {

            HStack {
                Text("Sign In")
                    .font(.system(size: 30, weight: .bold,
                        design: .rounded))
                    .foregroundColor(.black)
                Spacer()
                NavigationLink(destination: Text("Home View"),
                    tag: SignInNavigateTags.navigateToHome,
                    selection: $navigationTags) {
                Button(action: {
                    print("SignIn")
                    usernameError = username.isEmpty ? "Please enter username" : ""
                    passwordError = password.isEmpty ? "Please enter password" : ""

                    guard !username.isEmpty else { return }
                    guard !password.isEmpty else { return }

                    navigationTags = .navigateToHome
                }, label: {}).buttonStyle(CircleButtonStyle())
            }
        }

    }

    var signUpAndForgottenButtons: some View {
        HStack() {
            NavigationLink(destination: SignUpView(),
                tag: SignInNavigateTags.navigateToSignUp,
                selection: $navigationTags) {
                Button(action: { navigationTags = .navigateToSignUp },
                    label: { Text("Sign up").underline() })
            }
            Spacer()
            NavigationLink(destination: LodgeTaxReturnView(),
                tag: SignInNavigateTags.navigateToForgottenPassword,
                selection: $navigationTags) {
                Button(action: { navigationTags = .navigateToForgottenPassword },
                    label: { Text("Forgotten Passwords").underline() })

            }
        }.foregroundColor(Color.black.opacity(0.85))
        .font(.system(size: 14, weight: .semibold, design: .default))
    }
}
