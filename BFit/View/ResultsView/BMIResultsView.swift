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
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.06, green: 0.1, blue: 0.15),
                    Color(red: 0.17, green: 0.33, blue: 0.39),
                    Color(red: 0.31, green: 0.88, blue: 0.36)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            VStack {
                VStack {
                    Text("Your BMI is \(Int(result.rounded())) Ibs/in\u{00B2}!")
                        .font(.system(size: 32, weight: .bold, design: .default))
                        .multilineTextAlignment(.center)
                    Text("You are in the ")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .multilineTextAlignment(.center)
                }
                .foregroundStyle(.background)
                
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
        }
        
        
    }
}

#Preview {
    BMIResultsView(result: 20.0, bmiZone: "Healthy Weight", color: .green)
}
