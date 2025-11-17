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
    @State var isSignedIn: Bool = false
    @State var viewModel: AuthViewModel = AuthViewModel()
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            GoogleSignInButton {
                Task {
                    do {
                        try await viewModel.signInWithGoogle()
                        isSignedIn = true
                    } catch {
                        print("Sign in error: \(error)")
                    }
                }
            }
            .frame(width: 200, height: 44, alignment: .center)
        }
    }
}

#Preview {
    AuthView()
}
