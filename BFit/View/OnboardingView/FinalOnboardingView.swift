//
//  FinalOnboardingView.swift
//  BFit Calculator
//
//  Created by Ben Do on 12/22/25.
//

import SwiftUI

struct FinalOnboardingView: View {
    @Binding var showOnboarding: Bool
    let title: String
    let imageName: String
    let userDefaultManager = UserDefaultManager()
    
    var body: some View {
        ZStack {
            VStack {
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
                Button {
                    setAppHasLaunched()
                } label: {
                    Text("Done")
                        .frame(minWidth: 0, maxWidth: 200)
                        .padding()
                        .background(.white)
                        .foregroundStyle(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .buttonStyle(.automatic)

                Spacer(minLength: 50)
            }
            
            
        }
    }
    
    func setAppHasLaunched() {
        userDefaultManager.setAppHasLaunched(true)
        showOnboarding = false
    }
}

#Preview {
    FinalOnboardingView(showOnboarding: Binding.constant(true), title: "Get your results...", imageName: "results")
}
