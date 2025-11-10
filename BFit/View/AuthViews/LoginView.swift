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
            Text("Login")
                .font(.headline)
                .padding()
            GoogleSignInButton {
                handleSignInButton()
            }
        }
    }
    func handleSignInButton() {
        print("Google Sign In")
    }
}

#Preview {
    LoginView()
}
