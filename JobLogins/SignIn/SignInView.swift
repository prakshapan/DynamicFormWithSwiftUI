//
//  ContentView.swift
//  JobLogins
//
//  Created by Praks on 7/15/20.
//

import SwiftUI
enum SignInNavigateTags: String {
    case navigateToHome
    case navigateToForgottenPassword
    case navigateToSignUp
}

struct SignInView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var usernameError: String?
    @State var passwordError: String?

    @State var navigationTags: SignInNavigateTags? = nil

    var body: some View {
        NavigationView() {
            VStack(alignment: .leading) {
                TitleView(title: "Welcome\nBack").frame(height: 220)
                fields
                signinButton.padding(.vertical, 50)
                signUpAndForgottenButtons

            }.padding(.all, 20)
                .background(BackgroundView(image: Image.loginBackground))
                
        }.navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}








