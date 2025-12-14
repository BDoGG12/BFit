//
//  RevenueCatManager.swift
//  BFit Calculator
//
//  Created by Ben Do on 12/9/25.
//

// RevenueCatManager.swift
import Foundation
import RevenueCat

@MainActor
final class RevenueCatManager: ObservableObject {

    @Published private(set) var customerInfo: CustomerInfo?
    @Published private(set) var appUserId: String?

    /// Check if the user has BFit Calculator Premium entitlement active.
    var hasPremium: Bool {
        customerInfo?
            .entitlements[RCConstants.entitlementId]?
            .isActive == true // :contentReference[oaicite:8]{index=8}
    }

    init() {
        // Initial fetch on launch
        Task {
            await refreshCustomerInfo()
        }
    }
    
    func checkEntitlement() async -> Bool {
        var isSubscribed: Bool = false
        do {
            let customerInfo = try await Purchases.shared.customerInfo()
            if customerInfo.entitlements.all["BFit Calculator Premium"]?.isActive == true {
                // User has access to entitlement
                print("Customer Entitlement Status: \(customerInfo.entitlements.all["BFit Calculator Premium"]?.isActive ?? false)")
                isSubscribed = true
            } else {
                isSubscribed = false
            }
        } catch {
            print("Error: \(error)")
        }
        
        return isSubscribed
    }

    /// Listen continuously for CustomerInfo updates (purchase, restore, etc.)
    func startCustomerInfoListener() async {
        // customerInfoStream is an AsyncSequence of CustomerInfo updates
        for await info in Purchases.shared.customerInfoStream { // :contentReference[oaicite:9]{index=9}
            self.customerInfo = info
            self.appUserId = Purchases.shared.appUserID
        }
    }

    /// Manually refresh current CustomerInfo (safe to call often).
    func refreshCustomerInfo() async {
        do {
            let info = try await Purchases.shared.customerInfo() // :contentReference[oaicite:10]{index=10}
            self.customerInfo = info
            self.appUserId = Purchases.shared.appUserID
        } catch {
            // In production: log via analytics / show retry UI
            print("❌ Error fetching customer info:", error)
        }
    }

    /// Restore purchases (for “Restore Purchases” button).
    func restorePurchases() async {
        do {
            let info = try await Purchases.shared.restorePurchases()
            self.customerInfo = info
            self.appUserId = Purchases.shared.appUserID
        } catch {
            print("❌ Error restoring purchases:", error)
        }
    }

    /// Called when you manually get a new CustomerInfo (if you ever need to).
    func handleUpdated(_ info: CustomerInfo) {
        self.customerInfo = info
        self.appUserId = Purchases.shared.appUserID
    }
}
