//
//  AuthView.swift
//  BFit
//
//  Created by Ben Do on 11/14/25.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn

struct AuthView: View {
    var body: some View {
        VStack {
            Text("Login with:")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            GoogleSignInButton {
                print("Hi")
            }
            .frame(width: 200, height: 44, alignment: .center)
        }
    }
}

#Preview {
    AuthView()
}
