//
//  UserInputView.swift
//  BFit
//
//  Created by Ben Do on 11/9/25.
//

import SwiftUI

struct UserInputView: View {
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
        VStack {
            Text("Select Gender")
            Picker(selection: $selectedGender, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                Text("Male").tag("male")
                Text("Female").tag("female")
            }
            .onTapGesture {
                if selectedGender == "male" {
                    user.gender = .male
                } else {
                    user.gender = .female
                }
            }
        }
        .padding(10)
        VStack {
            // Age
            VStack {
                VStack{
                    HStack {
                        Text("Age: \(Int(age)) yrs")
                    }
                    Slider(
                        value: $age,
                            in: 10...100,
                            step: 1
                        ) {
                            Text("Age")
                        } minimumValueLabel: {
                            Text("10")
                        } maximumValueLabel: {
                            Text("100")
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
                    }
                    Slider(
                        value: $height,
                            in: 40...90,
                            step: 1
                        ) {
                            Text("Height")
                        } minimumValueLabel: {
                            Text("40")
                        } maximumValueLabel: {
                            Text("90")
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
                    }
                    Slider(
                        value: $weight,
                            in: 66...440,
                            step: 1
                        ) {
                            Text("Height")
                        } minimumValueLabel: {
                            Text("66")
                        } maximumValueLabel: {
                            Text("440")
                        } onEditingChanged: { editing in
                            isEditing = editing
                            user.weight = weight
                        }
                }
            }
        }
        .padding(10)
        
        VStack {
            Button("Calculate", action: {
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
       
    }
    
    func getResults() {
        // Assign values to result
        result = viewModel.calculateBodyFatPercentage(user)
        
        // Assign values to resultMsg
        resultMsg = viewModel.bodyFatPercentageRange(result ?? 10.1, user)
        
        // Assign values to resultColor
        resultColor = viewModel.colorCodeBFP(resultMsg ?? "Unknown")
        
        // Change showSheet to true
        showSheet = true
        showNext = true
        print("Results are calculated: \(result ?? 10.1)%, \(resultMsg ?? "Unknown, please try again"), \(resultColor ?? .blue)")
    }
}

#Preview {
    UserInputView()
}
