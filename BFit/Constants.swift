//
//  Constants.swift
//  BFit Calculator
//
//  Created by Ben Do on 12/5/25.
//

import Foundation

struct Constants {
    static let testAPIKey: String = {
        guard let testAPIKey = Bundle.main.infoDictionary?["TEST_API_KEY"] as? String else {
            fatalError("TEST_API_KEY not found in Secrets.xcconfig file")
        }
        return testAPIKey
    }()
}
