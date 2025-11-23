//
//  SignUpView.swift
//  BFit
//
//  Created by Ben Do on 11/9/25.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn
import AuthenticationServices

struct SignUpView: View {
    var body: some View {
        VStack {
            Text("Sign up with:")
                .font(.title)
                .bold()
            
            GoogleSignInButton {
                Task {
                    
                }
            }
            .frame(width: 200, height: 44, alignment: .center)
            
            Text("or")
                .font(.title)
                .fontWeight(.medium)
                .padding()
            
            // Apple Sign In
            SignInWithAppleButton { idRequest in
                print(idRequest.user ?? "Unknown User")
            } onCompletion: { result
                in
                print("Result: \(result)")
            }
            .frame(width: 200, height: 44, alignment: .center)
        }
    }
    
    func handleSignInButton() {
        
    }
}

#Preview {
    SignUpView()
}
