//
//  LaunchScreenView.swift
//  BFit Calculator
//
//  Created by Ben Do on 2/18/26.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        if isActive {
            ContentView()
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
                }
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}
