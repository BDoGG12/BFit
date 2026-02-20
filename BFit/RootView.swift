//
//  RootView.swift
//  BFit Calculator
//
//  Created by Ben Do on 12/10/25.
//

import SwiftUI
import RevenueCat
import RevenueCatUI

struct RootView: View {
    @EnvironmentObject private var rc: RevenueCatManager
    @State private var isCustomerCenterPresented = false
    
    var body: some View {
        NavigationStack {
            TabView {
                Tab("Body Fat Calculator", systemImage: "figure.walk") {
                    ContentView()
                        .navigationTitle("BFit Calculator")
        //                .toolbar {
        //                    ToolbarItem(placement: .topBarTrailing) {
        //                        Button {
        //                            isCustomerCenterPresented = true
        //                        } label: {
        //                            Image(systemName: "person.crop.circle")
        //                        }
        //                        .accessibilityLabel("Manage Subscriptions")
        //                    }
        //                }
                }
                Tab("BMI Calculator", systemImage: "scalemass") {
                    Text("Calculate BMI")
                }
                
                }
                
        }
                
        // Customer Center (subscription management)
//        .sheet(isPresented: $isCustomerCenterPresented) {
//            CustomerCenterView()
//        }
    }
}

#Preview {
    RootView()
}
