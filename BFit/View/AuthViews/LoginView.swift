//
//  LoginView.swift
//  BFit
//
//  Created by Ben Do on 11/9/25.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn

struct LoginView: View {
    var body: some View {
        VStack {
            Text("Login with:")
                .font(.largeTitle)
                .padding()
            GoogleSignInButton {
                handleSignInButton()
            }
            .frame(width: 10.0, height: 50.0, alignment: .center)
            .buttonStyle(.borderedProminent)
            Text("or")
                .font(.title)
                .fontWeight(.medium)
                .padding()
            Button("Apple") {
                print("Sign in with Apple")
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(.black)
            .cornerRadius(10)
        }
    }
    func handleSignInButton() {
        print("Google Sign In")
    }
}

#Preview {
    LoginView()
}
