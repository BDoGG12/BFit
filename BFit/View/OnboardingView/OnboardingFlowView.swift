//
//  OnboardingFlowView.swift
//  BFit Calculator
//
//  Created by Ben Do on 12/21/25.
//

import SwiftUI

struct OnboardingFlowView: View {
    var body: some View {
        TabView {
            OnboardingPageView(title: "Welcome to BFit Calculator!", imageName: "selection", description: "You can choose any method you like to calculate your body fat.")
            OnboardingPageView(title: "You can pick...", imageName: "bmi_input", description: "the BMI Method")
            OnboardingPageView(title: "Or...", imageName: "navy_seal_input", description: "the Navy Seal Method")
            OnboardingPageView(title: "Final Step", imageName: "results", description: "are the results!")
        }
        .background(.blue)
        .tabViewStyle(.page)
    }
}

#Preview {
    OnboardingFlowView()
}
