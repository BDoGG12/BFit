//
//  BodyFatViewModel.swift
//  BFit
//
//  Created by Ben Do on 11/10/25.
//

import Combine
import Foundation

class BodyFatViewModel: ObservableObject {
    @Published var gender: Gender = .male
    @Published var height: Double = 178
    @Published var weight: Double = 60
    @Published var age: Int = 25
    
    func calculateBodyFatPercentage(gender: Gender, height: Double, weight: Double, age: Int) -> Double {
        
        // Formula
        // BFP = (1.2 * BMI) + (0.23 * age) - (10.8 * 1) - 5.4
        // If gender is male, use binary value of 1, else 0
        let BMI = weight / pow(height / 100, 2)
        var result: Double
        
        if gender == .male {
            result = (1.2 * BMI) + (0.23 * Double(age)) - 10.8 - 5.4
        } else {
            result = (1.2 * BMI) + (0.23 * Double(age)) - 5.4
        }
        return result
    }
    
    func bodyFatPercentageRange(bfpResult: Double, gender: Gender) -> String {
        
        // if gender is male, then do the body fat percentage checks
        // if gender is female, same thing
        
        var bfpFeedback = ""
        
        if gender == .male {
            switch bfpResult {
            case 2...5:
                bfpFeedback = "Essential Fat"
            case 6...13:
                bfpFeedback = "Athletes"
            case 14...17:
                bfpFeedback = "Fitness"
            case 18...24:
                bfpFeedback = "Average"
            case 25..<36:
                bfpFeedback = "Obese"
            default:
                bfpFeedback = "Check your results again"
            }
        } else {
            switch bfpResult {
            case 10...13:
                bfpFeedback = "Essential Fat"
            case 14...20:
                bfpFeedback = "Athletes"
            case 21...24:
                bfpFeedback = "Fitness"
            case 25...31:
                bfpFeedback = "Average"
            case 32..<40:
                bfpFeedback = "Obese"
            default:
                bfpFeedback = "Check your results again"
            }
        }
        return bfpFeedback
    }
}
