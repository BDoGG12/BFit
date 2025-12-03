//
//  NavySealUserInputView.swift
//  BFit Calculator
//
//  Created by Ben Do on 12/1/25.
//

import SwiftUI

struct NavySealUserInputView: View {
    @State private var selectedGender: String = "male"
    @State private var height = 65.0
    @State private var neck = 16.0
    @State private var waist = 40.0
    @State private var hip = 48.0

    @State private var viewModel = BodyFatViewModel()
    @State private var result: Double? = nil
    @State private var user: NavySealUser = NavySealUser(height: 69, waist: 34, neck: 15, gender: .male, hip: 0)
    
    // Results
    @State private var resultMsg: String? = nil
    @State private var resultColor: Color? = nil
    
    // Show Sheet
    @State private var showSheet: Bool = false
    
    // Show Next Button
    @State private var showNext: Bool = false
    
    @State private var isEditing = false
    var body: some View {
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
                
                VStack {
                    // Gender
                    HStack {
                        Text("Select Gender:")
                            .font(.title3.weight(.bold))
                            .foregroundStyle(.white)
                            
                        Picker(selection: $selectedGender, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                            Text("Male").tag("male")
                            Text("Female").tag("female")
                        }
                        .onChange(of: selectedGender, {
                            if selectedGender == "male" {
                                user.gender = .male
                            } else {
                                user.gender = .female
                            }
                        })
                    }
                    .padding(10)
                    VStack {
                        // Neck
                        VStack {
                            VStack{
                                HStack {
                                    Text("Neck: \(neck.formatted()) in")
                                        .font(.title3.weight(.bold))
                                        .foregroundStyle(.white)
                                }
                                Slider(
                                    value: $neck,
                                        in: 10...25,
                                        step: 1
                                    ) {
                                        Text("Neck")
                                    } minimumValueLabel: {
                                        Text("10")
                                            .font(.headline.weight(.semibold))
                                            .foregroundStyle(.white)
                                    } maximumValueLabel: {
                                        Text("25")
                                            .font(.headline.weight(.semibold))
                                            .foregroundStyle(.white)
                                    } onEditingChanged: { editing in
                                        isEditing = editing
                                        user.neck = Double(neck)
                                    }
                            }
                        }
                        
                        // Height
                        VStack {
                            VStack{
                                HStack {
                                    Text("Height: \(height.formatted()) in")
                                        .font(.title3.weight(.bold))
                                        .foregroundStyle(.white)
                                }
                                Slider(
                                    value: $height,
                                        in: 40...90,
                                        step: 1
                                    ) {
                                        Text("Height")
                                            .font(.title3.weight(.semibold))
                                            .foregroundStyle(.white)
                                    } minimumValueLabel: {
                                        Text("40")
                                            .font(.headline.weight(.semibold))
                                            .foregroundStyle(.white)
                                    } maximumValueLabel: {
                                        Text("90")
                                            .font(.headline.weight(.semibold))
                                            .foregroundStyle(.white)
                                    } onEditingChanged: { editing in
                                        isEditing = editing
                                        user.height = height
                                    }
                            }
                        }
                        
                        // Waist
                        VStack {
                            VStack{
                                HStack {
                                    Text("Waist: \(waist.formatted()) in")
                                        .font(.title3.weight(.bold))
                                        .foregroundStyle(.white)
                                }
                                Slider(
                                    value: $waist,
                                        in: 20...70,
                                        step: 1
                                    ) {
                                        Text("Waist")
                                    } minimumValueLabel: {
                                        Text("20")
                                            .font(.headline.weight(.semibold))
                                            .foregroundStyle(.white)
                                    } maximumValueLabel: {
                                        Text("70")
                                            .font(.headline.weight(.semibold))
                                            .foregroundStyle(.white)
                                    } onEditingChanged: { editing in
                                        isEditing = editing
                                        user.waist = waist
                                    }
                            }
                        }
                        
                        // Hip
                        if user.gender == .female {
                            VStack {
                                VStack{
                                    HStack {
                                        Text("Hip: \(hip.formatted()) in")
                                            .font(.title3.weight(.bold))
                                            .foregroundStyle(.white)
                                    }
                                    Slider(
                                        value: $hip,
                                        in: 25...70,
                                            step: 1
                                        ) {
                                            Text("Hip")
                                        } minimumValueLabel: {
                                            Text("25")
                                                .font(.headline.weight(.semibold))
                                                .foregroundStyle(.white)
                                        } maximumValueLabel: {
                                            Text("70")
                                                .font(.headline.weight(.semibold))
                                                .foregroundStyle(.white)
                                        } onEditingChanged: { editing in
                                            isEditing = editing
                                            user.hip = hip
                                        }
                                }
                                
                            }
                        }
                        
                    }
                    .padding(10)
                    
                    VStack {
                        Button("Calculate Body Fat %", action: {
                            getResults()
                        })
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .tint(.blue)
                        
                        Button("", action: {
                            
                        })
                        .sheet(isPresented: $showSheet) {
                            ResultsView(result: result ?? 0.0, bfpZone: resultMsg ?? "Unknown", color: resultColor ?? .gray)
                        }
                        .disabled(showNext == false)
                        
                    }
                    .toolbar(content: {
                        ToolbarItem(placement: .principal) {
                            Text("Navy Seal Input")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        }
                    })
                    .navigationBarTitleDisplayMode(.large)
                }
            }
            
            

        }
        
               
    }
    
    func getResults() {
        
        // Assign values to result
        result = viewModel.calculateNavySealBodyFatPercentage(user)
        
        // Get Result message
        resultMsg = viewModel.navySealBodyFatPercentageRange(result ?? 0.0, user)
        
        // Get Color
        
        resultColor = viewModel.colorCodeBFP(resultMsg ?? "Unknown")
        
        showSheet = true
        showNext = true
        
        print("Results are calculated: \(result ?? 10.1)%, \(resultMsg ?? "Unknown, please try again"), \(resultColor ?? .blue)")
    }
}

#Preview {
    NavySealUserInputView()
}
