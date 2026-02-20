//
//  BMIResultsView.swift
//  BFit Calculator
//
//  Created by Ben Do on 2/17/26.
//

import SwiftUI

struct BMIResultsView: View {
    @Environment(\.dismiss) var dismiss
    let result: Double
    let bmiZone: String
    let color: Color
    var body: some View {
        VStack {
            Text("Your BMI is \(Int(result.rounded())) Ibs/in\u{00B2}!")
                .font(.system(size: 32, weight: .bold, design: .default))
                .multilineTextAlignment(.center)
            Text("You are in the ")
                .font(.system(size: 25, weight: .bold, design: .default))
                .multilineTextAlignment(.center)
            Text("\(bmiZone) Zone!")
                .font(.system(size: 30, weight: .bold, design: .default))
                .foregroundStyle(color)
            Button("Ok") {
                dismiss()
            }
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
        }
        .background {
            Image("results_fit")
        }
    }
}

#Preview {
    BMIResultsView(result: 20.0, bmiZone: "Healthy Weight", color: .green)
}
