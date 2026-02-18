//
//  LaunchScreenView.swift
//  BFit Calculator
//
//  Created by Ben Do on 2/18/26.
//

import SwiftUI
import RevenueCat

struct LaunchScreenView: View {
    @State private var isActive: Bool = false
    @StateObject private var revenueCat = RevenueCatManager()
    @State private var showOnboarding: Bool
    let userDefaultManager = UserDefaultManager()
    
    init() {
        let appHasLaunched: Bool = userDefaultManager.getAppHasLaunched()
        
        showOnboarding = !appHasLaunched
        print("Shows onboarding: \(showOnboarding)")
        // Verbose logs while integrating
        Purchases.logLevel = .debug
        
        // Configure Purchases once at app launch
        Purchases.configure(with: Configuration
            .builder(withAPIKey: AppSecrets.revenueCatAPIKey)
            .with(storeKitVersion: .storeKit2)
            .build()
        )
    }
    
    var body: some View {
        if isActive {
            RootView()
                .sheet(isPresented: $showOnboarding, content: {
                    OnboardingFlowView(showOnboarding: $showOnboarding)
                })
                .environmentObject(revenueCat)
                // Listen for customer info updates for the entire app lifecycle
//                .task {
//                    await revenueCat.startCustomerInfoListener()
//                }
        } else {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.blue.opacity(0.7),
                        Color.purple.opacity(0.4),
                        Color.black
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack {
                    Image("LaunchScreenImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    Text("Welcome to BFit Calculator")
                        .foregroundStyle(.white)
                        .font(.largeTitle.bold())
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}
