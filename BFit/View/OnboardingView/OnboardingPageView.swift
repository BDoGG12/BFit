//
//  OnboardingView.swift
//  BFit Calculator
//
//  Created by Ben Do on 12/21/25.
//

import SwiftUI

struct OnboardingPageView: View {
    let title: String
    let imageName: String
    let description: String
    
    var body: some View {
        ZStack {
            VStack {
                Spacer(minLength: 20)
                Text(title)
                    .font(.title)
                    .foregroundStyle(.white)
                VStack {
                    Image(imageName)
                        .resizable()
                        .font(.largeTitle)
                        .padding()
                        .clipShape(.rect(cornerRadius: 60))
                }
                .foregroundStyle(.white)
                Text(description)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                    .foregroundStyle(.white)
                Spacer(minLength: 50)
            }
            
            
        }
    }
}

#Preview {
    OnboardingPageView(title: "Welcome to BFit Calculator!", imageName: "selection", description: "Select how to calculate your body fat.")
}
