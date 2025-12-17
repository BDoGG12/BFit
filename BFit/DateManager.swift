//
//  DateManager.swift
//  BFit Calculator
//
//  Created by Ben Do on 12/17/25.
//

import Foundation

class DateManager: ObservableObject {
    
    
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }
    
    
}
