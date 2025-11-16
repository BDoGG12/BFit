//
//  BFitApp.swift
//  BFit
//
//  Created by Ben Do on 11/9/25.
//

import SwiftUI
import GoogleSignIn
import FirebaseCore

@main
struct BFitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: {
                    FirebaseApp.configure()
                })
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}
