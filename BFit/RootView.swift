//
//  RootView.swift
//  BFit Calculator
//
//  Created by Ben Do on 12/10/25.
//

import SwiftUI
import RevenueCat
import RevenueCatUI

struct RootView: View {
    @EnvironmentObject private var rc: RevenueCatManager
    @State private var isCustomerCenterPresented = false
    
    var body: some View {
        NavigationStack {
            ContentView()
                .navigationTitle("BFit Calculator")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isCustomerCenterPresented = true
                        } label: {
                            Image(systemName: "person.crop.circle")
                        }
                        .accessibilityLabel("Manage Subscriptions")
                    }
                }
        }
        // Paywall: only if BFit premium entitlement is not active
        .presentPaywallIfNeeded(
            requiredEntitlementIdentifier: RCConstants.entitlementId,
            purchaseCompleted: { customerInfo in
                // Called when purchase finishes successfully
                Task { @MainActor in
                    rc.handleUpdated(customerInfo)
                }
            },
            restoreCompleted: { customerInfo in
                // Called when restore finishes successfully
                Task { @MainActor in
                    rc.handleUpdated(customerInfo)
                }
            }
        )
        
        // Customer Center (subscription management)
        .sheet(isPresented: $isCustomerCenterPresented) {
            CustomerCenterView()
        }
    }
}

#Preview {
    RootView()
}
