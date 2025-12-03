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
    
    func calculateNavySealBodyFatPercentage(_ user: NavySealUser) -> Double {
        /*
         Formula:
         Men's BFP = 86.010 * log10(waist - neck) - 70.041 * log10(height) + 36.76
         Women's BFP = 163.205 * log10(waist + hip - neck) - 97.684 * log10(height) - 78.387
         */
        
        var bfp: Double = 0
        if user.gender == .male {
            bfp = getMaleNavySealBodyFatPercentage(user)
        } else {
            bfp = getFemaleNavySealBodyFatPercentage(user)
        }
        return bfp
    }
    
    func getMaleNavySealBodyFatPercentage(_ user: NavySealUser) -> Double {
        let maleBFP = 86.010 * log10(user.waist - user.neck) - 70.041 * log10(user.height) + 36.76
        return maleBFP
    }
    
    func getFemaleNavySealBodyFatPercentage(_ user: NavySealUser) -> Double {
        let femaleBFP = 163.205 * log10(user.waist + user.hip - user.neck) - 97.684 * log10(user.height) - 78.387
        return femaleBFP
    }
    
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
    
    func navySealBodyFatPercentageRange(_ bfpResult: Double, _ user: NavySealUser) -> String {
        var bfpFeedback = ""
        let roundedResult = bfpResult.rounded()
        
        if user.gender == .male {
            switch roundedResult {
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
            switch roundedResult {
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
    
    func bodyFatPercentageRange(_ bfpResult: Double, _ user: User) -> String {
        
        // if gender is male, then do the body fat percentage checks
        // if gender is female, same thing
        
        var bfpFeedback = ""
        let roundedResult = bfpResult.rounded()
        
        if user.gender == .male {
            switch roundedResult {
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
            switch roundedResult {
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
