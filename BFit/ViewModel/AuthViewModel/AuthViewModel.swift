//
//  File.swift
//  BFit
//
//  Created by Ben Do on 11/14/25.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

enum AuthError: Error {
    case tokenError(message: String)
}

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    func signInWithGoogle() async -> Bool {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            fatalError("No client ID found in Firebase configuration")
        }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        var errorMessage: String? = ""
        
        guard let windowScene = await UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = await windowScene.windows.first,
              let rootViewController = await window.rootViewController
        else {
            print("There is no root view controller")
            return false
        }
        
        do {
            let userAuth = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            let user = userAuth.user
            guard let idToken = user.idToken else {
                throw AuthError.tokenError(message: "No ID token found")
            }
            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            let result = try await Auth.auth().signIn(with: credential)
            let firebaseUser = result.user
            print("Signed in with user: \(firebaseUser.uid)")
            return true
        } catch {
            print(error.localizedDescription)
            errorMessage = error.localizedDescription
            return false
        }
        
       
        
        return false
    }
    
}
