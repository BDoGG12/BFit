//
//  RootView.swift
//  BFit Calculator
//
//  Created by Ben Do on 12/10/25.
//

import SwiftUI

struct RootView: View {
    
    var body: some View {
        NavigationStack {
            TabView {
                Tab("Body Fat Calculator", systemImage: "figure.walk") {
                    ContentView()
                        .navigationTitle("BFit Calculator")
                }
                Tab("BMI Calculator", systemImage: "scalemass") {
                    BMIInputView()
                        .navigationTitle("BMI Calculator")
                }
                
                }
                
        }
                
    }
}

#Preview {
    RootView()
}
