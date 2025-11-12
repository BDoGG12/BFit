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
                    viewModel.gender = "male"
                } else {
                    viewModel.gender = "female"
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
                            viewModel.age = Int(age)
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
                            viewModel.height = height
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
                            viewModel.weight = weight
                        }
                }
            }
        }
        .padding(10)
        
        Button("Submit") {
            print("Info submitted")
            print("Gender: \(selectedGender)")
            print("Age: \(viewModel.age)")
            print("Height: \(viewModel.height)")
            print("Weight: \(viewModel.weight)")
            let result = viewModel.calculateBodyFatPercentage(gender: selectedGender, height: viewModel.height, weight: viewModel.weight, age: viewModel.age)
            let msg = viewModel.bodyFatPercentageRange(bfpResult: result, gender: selectedGender)
            print("Body fat percentage is \(result)%. \(msg)")
        }
        .tint(.blue)
       
    }
}

#Preview {
    UserInputView()
}
