//
//  BFitApp.swift
//  BFit
//
//  Created by Ben Do on 11/9/25.
//

import SwiftUI
import RevenueCat


@main
struct BFitApp: App {
    
    init() {
        Purchases.configure(withAPIKey: Constants.testAPIKey)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
