//
//  LaunchScreenView.swift
//  BFit Calculator
//
//  Created by Ben Do on 2/18/26.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var isActive: Bool = false
    @State private var showOnboarding: Bool
    let userDefaultManager = UserDefaultManager()
    
    init() {
        let appHasLaunched: Bool = userDefaultManager.getAppHasLaunched()
        
        showOnboarding = !appHasLaunched
        print("Shows onboarding: \(showOnboarding)")
    }
    
    var body: some View {
        if isActive {
            RootView()
                .sheet(isPresented: $showOnboarding, content: {
                    OnboardingFlowView(showOnboarding: $showOnboarding)
                })
        } else {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.blue.opacity(0.7),
                        Color.purple.opacity(0.4),
                        Color.black
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack {
                    Image("LaunchScreenImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    Text("Welcome to BFit Calculator")
                        .foregroundStyle(.white)
                        .font(.largeTitle.bold())
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}
