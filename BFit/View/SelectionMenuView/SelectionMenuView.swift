//
//  SelectionMenuView.swift
//  BFit Calculator
//
//  Created by Ben Do on 12/3/25.
//

import SwiftUI

struct SelectionMenuView: View {
    @State private var navigationPath = NavigationPath()
    @State private var selection = "Select"
    @State private var navigationChoice = ["Select", "BMI Method", "Navy Seal Method"]
    @State private var isBMISelected: Bool = false
    @State private var isSelected: Bool = false
    var body: some View {
        // Navigation Stack
        NavigationStack {
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
                // Dropdown menu of UserInputView and NavySealUserInputView
                VStack {
                    VStack {
                        
                        Text("Select Body Fat % Calculation Method")
                            .font(.largeTitle.weight(.bold))
                            .padding()
                        Picker("Choose a method", selection: $selection) {
                            Text("Select").tag("Select")
                            Text("BMI Method").tag("BMI Method")
                            Text("Navy Seal Method").tag( "Navy Seal Method")
                        }
                        .onAppear {
                            selection = "Select"
                        }
                        .onChange(of: selection) {
                            if selection == "BMI Method" || selection == "Navy Seal Method" {
                                isSelected = true
                            } else {
                                isSelected = false
                            }
                        }
                    }
                    .pickerStyle(.menu)
                    .padding()
                    .navigationDestination(isPresented: $isSelected) {
                        switch selection {
                        case "Select":
                            Text("Please select a method")
                        case "BMI Method":
                            UserInputView()
                        case "Navy Seal Method":
                            NavySealUserInputView()
                        default:
                            Text("Unknown Selection")
                        }
                    }
                }
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    SelectionMenuView()
}
