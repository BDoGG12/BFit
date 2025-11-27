//
//  BodyFatViewModel.swift
//  BFit
//
//  Created by Ben Do on 11/10/25.
//

import Combine
import Foundation
import SwiftUICore

class BodyFatViewModel: ObservableObject {
    
    func calculateBodyFatPercentage(_ user: User) -> Double {
        
        // Formula
        // BFP = (1.2 * BMI) + (0.23 * age) - (10.8 * 1) - 5.4
        // If gender is male, use binary value of 1, else 0
        let BMI = (user.weight * 703) / pow(user.height, 2)
        var result: Double
        
        if user.gender == .male {
            result = (1.2 * BMI) + (0.23 * Double(user.age)) - (10.8 * 1) - 5.4
        } else {
            result = (1.2 * BMI) + (0.23 * Double(user.age)) - (10.8 * 0) - 5.4
        }
        return result
    }
    
    func bodyFatPercentageRange(_ bfpResult: Double, _ user: User) -> String {
        
        // if gender is male, then do the body fat percentage checks
        // if gender is female, same thing
        
        var bfpFeedback = ""
        
        if user.gender == .male {
            switch bfpResult {
            case 2...5:
                bfpFeedback = "Essential Fat"
            case 6...13:
                bfpFeedback = "Athletes"
            case 14...17:
                bfpFeedback = "Fitness"
            case 18...24:
                bfpFeedback = "Average"
            case 25...:
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
            case 32...:
                bfpFeedback = "Obese"
            default:
                bfpFeedback = "Check your results again"
            }
        }
        return bfpFeedback
    }
    
    func colorCodeBFP(_ result: String) -> Color {
        
        switch result {
        case "Essential Fat":
            return Color.cyan
        case "Athletes":
            return Color.green
        case "Fitness":
            return Color.yellow
        case "Average":
            return Color.orange
        case "Obese":
            return Color.red
        default:
            return Color.black
        }
    }
}
