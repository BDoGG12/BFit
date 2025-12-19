//
//  DateManager.swift
//  BFit Calculator
//
//  Created by Ben Do on 12/17/25.
//

import Foundation

class DateManager: ObservableObject {
    let dateFormatter = DateFormatter()

    
    func getCurrentDate() -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }
    
    func getNextDate() -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let nextDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        return dateFormatter.string(from: nextDate)
    }
    
    func convertToDate(_ dateString: String) -> Date? {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: dateString)
    }
    
    func convertToDateString(_ date: Date) -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    func getLastCalcDate() -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()
        let yesterdayString = dateFormatter.string(from: yesterday)
        return UserDefaults.standard.string(forKey: "lastCalcDate") ?? yesterdayString
    }
}
