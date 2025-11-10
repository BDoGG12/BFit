//
//  UserInputView.swift
//  BFit
//
//  Created by Ben Do on 11/9/25.
//

import SwiftUI

struct UserInputView: View {
    enum Gender: String, CaseIterable, Identifiable {
    case male, female
        var id: Self {self}
    }
    @State private var selectedGender: Gender = .male
    var body: some View {
        VStack {
            Text("Select Gender")
            Picker(selection: $selectedGender, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                Text("Male").tag(Gender.male)
                Text("Female").tag(Gender.female)
            }
        }
        .padding(10)
        VStack {
            HStack {
                Text("Height")
                    .frame(alignment: .leading)

            }
            Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    UserInputView()
}
