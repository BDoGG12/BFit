//
//  BMIInputView.swift
//  BFit Calculator
//
//  Created by Ben Do on 2/17/26.
//

import SwiftUI

struct BMIInputView: View {
    @State private var selectedGender: String = "male"
    @State private var height = 65.0
    @State private var age = 55.0
    @State private var weight = 253.0
    @State private var viewModel = BodyFatViewModel()
    @State private var result: Double? = nil
    @State private var user: User = User(age: 55, height: 65, weight: 253, gender: .male)
    
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
                        // Age
                        VStack {
                            VStack{
                                HStack {
                                    Text("Age: \(Int(age)) yrs")
                                        .font(.title3.weight(.bold))
                                        .foregroundStyle(.white)
                                }
                                Slider(
                                    value: $age,
                                        in: 10...100
                                    ) {
                                        Text("Age")
                                    } minimumValueLabel: {
                                        Text("10")
                                            .font(.headline.weight(.semibold))
                                            .foregroundStyle(.white)
                                    } maximumValueLabel: {
                                        Text("100")
                                            .font(.headline.weight(.semibold))
                                            .foregroundStyle(.white)
                                    } onEditingChanged: { editing in
                                        isEditing = editing
                                        user.age = Int(age)
                                    }
                            }
                        }
                        
                        // Height
                        VStack {
                            VStack{
                                HStack {
                                    Text("Height: \(Int(height)) in")
                                        .font(.title3.weight(.bold))
                                        .foregroundStyle(.white)
                                }
                                Slider(
                                    value: $height,
                                        in: 40...90
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
                        
                        // Weight
                        VStack {
                            VStack{
                                HStack {
                                    Text("Weight: \(Int(weight)) lbs")
                                        .font(.title3.weight(.bold))
                                        .foregroundStyle(.white)
                                }
                                Slider(
                                    value: $weight,
                                        in: 66...440
                                    ) {
                                        Text("Height")
                                    } minimumValueLabel: {
                                        Text("66")
                                            .font(.headline.weight(.semibold))
                                            .foregroundStyle(.white)
                                    } maximumValueLabel: {
                                        Text("440")
                                            .font(.headline.weight(.semibold))
                                            .foregroundStyle(.white)
                                    } onEditingChanged: { editing in
                                        isEditing = editing
                                        user.weight = weight
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
                            BMIResultsView(result: result ?? 0.0, bmiZone: resultMsg ?? "", color: resultColor ?? .black)
                        }
                        .disabled(showNext == false)
                        
                    }
                    .toolbar(content: {
                        ToolbarItem(placement: .principal) {
                            Text("BMI Input")
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
        result = viewModel.calculateBMI(user)
        resultMsg = viewModel.bmiRange(result ?? 0.0, user)
        resultColor = viewModel.colorCodeBMI(resultMsg ?? "")
        showNext = true
        showSheet = true
    }
}

#Preview {
    BMIInputView()
}
