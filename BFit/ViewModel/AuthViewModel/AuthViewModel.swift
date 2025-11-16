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
    
    func signInWithGoogle() async throws {
        // Assign clientID to firebase's app client id
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            throw AuthError.tokenError(message: "Client ID not found")
        }
        
        // Create Google Sign In config object
        let config = GIDConfiguration(clientID: clientID)
        
        // Start sign in flow
        // find view controller
        let scene = await UIApplication.shared.connectedScenes.first as! UIWindowScene
        guard let rootViewController = await scene.windows.first?.rootViewController else {
            fatalError("There is no root view controller")
        }
        
        // google sign in response
        let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
        
        let user = result.user
        guard let idToken = user.idToken?.tokenString else {
            throw AuthError.tokenError(message: "Failed to get id token")
        }
        
        // Firebase Auth
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
        try await Auth.auth().signIn(with: credential)
    }
    
    func signOutWithGoogle() async throws {
        GIDSignIn.sharedInstance.signOut()
        try Auth.auth().signOut()
    }
    
}
