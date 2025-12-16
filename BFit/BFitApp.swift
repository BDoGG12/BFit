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
    @StateObject private var revenueCat = RevenueCatManager()
    
    init() {
        // Verbose logs while integrating
        Purchases.logLevel = .debug
        
        // Configure Purchases once at app launch
        Purchases.configure(with: Configuration
            .builder(withAPIKey: RCConstants.apiKey)
            .with(storeKitVersion: .storeKit2)
            .build()
        )
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(revenueCat)
                // Listen for customer info updates for the entire app lifecycle
                .task {
                    await revenueCat.startCustomerInfoListener()
                }
        }
    }
}
