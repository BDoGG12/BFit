//
//  AppSecrets.swift
//  BFit Calculator
//
//  Created by Ben Do on 12/27/25.
//

import Foundation
import RevenueCat

enum AppSecrets {
    static var revenueCatAPIKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "REVENUECAT_API_KEY") as? String, !key.isEmpty else {
            fatalError("Missing REVENUECAT_API_KEY. Check your xcconfig + Info.plist injection")
        }
        return key
    }
}
