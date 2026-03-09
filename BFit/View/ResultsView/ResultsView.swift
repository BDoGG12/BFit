//
//  ResultsView.swift
//  BFit
//
//  Created by Ben Do on 11/12/25.
//

import SwiftUI

struct ResultsView: View {
    @Environment(\.dismiss) var dismiss // For dismissing the sheet
    let result: Double
    let bfpZone: String
    let color: Color
    @State private var floating = false
    
    var body: some View {
        VStack {
            Image("bfit_mascot")
                .resizable()
                .scaledToFit()
                .offset(y: floating ? -8 : 8)
                .frame(width: 200, height: 200)
                .animation(.easeInOut.repeatForever(autoreverses: true), value: floating)
                
            Text("Your Body Fat Percentage is \(Int(result.rounded()))%!")
                .font(.system(size: 32, weight: .bold, design: .default))
                .multilineTextAlignment(.center)
            Text("You are in the ")
                .font(.system(size: 25, weight: .bold, design: .default))
                .multilineTextAlignment(.center)
            Text("\(bfpZone) Zone!")
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
        .onAppear(perform: {
            floating = true
        })
        .background {
            Image("results_fit")
        }
    }
}

#Preview {
    ResultsView(result: 20.0, bfpZone: "Fitness", color: .green)
}
