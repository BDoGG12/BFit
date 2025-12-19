//
//  UserDefaultManager.swift
//  BFit Calculator
//
//  Created by Ben Do on 12/17/25.
//

import Foundation

class UserDefaultManager: UserDefaults {
    
    func store(value: Any?, forKey key: String) {
        set(value, forKey: key)
    }
    
    func saveUsageAmount(amount: Int) {
        UserDefaults.standard.set(amount, forKey: "usageAmt")
    }
    
    func storeLastCalculationDate(date: String) {
        UserDefaults.standard.set(date, forKey: "lastCalcDate")
    }
}
