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
    @State private var showOnboarding: Bool
    let userDefaultManager = UserDefaultManager()
    
    init() {
        let appHasLaunched: Bool = userDefaultManager.getAppHasLaunched()
        
        showOnboarding = !appHasLaunched
        print("Shows onboarding: \(showOnboarding)")
        // Verbose logs while integrating
//        Purchases.logLevel = .debug
//        
//        // Configure Purchases once at app launch
//        Purchases.configure(with: Configuration
//            .builder(withAPIKey: AppSecrets.revenueCatAPIKey)
//            .with(storeKitVersion: .storeKit2)
//            .build()
//        )
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .sheet(isPresented: $showOnboarding, content: {
                    OnboardingFlowView(showOnboarding: $showOnboarding)
                })
                .environmentObject(revenueCat)
                // Listen for customer info updates for the entire app lifecycle
//                .task {
//                    await revenueCat.startCustomerInfoListener()
//                }
        }
    }
}
