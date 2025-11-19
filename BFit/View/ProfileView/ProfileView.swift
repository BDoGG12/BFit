//
//  ProfileView.swift
//  BFit
//
//  Created by Ben Do on 11/19/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            
            // HStack with Name and Profile Icon
            HStack {
                Text("John Doe")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 44, height: 44)
                    .padding()
                    .frame(alignment: .trailing)
                
                
            }
                        
            // VStack of DOB, Age, Height, Gender, and Current BF %
            VStack {
                // DOB
                HStack {
                    Text("Date of Birth:")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("1/1/2000")
                        .font(.title2)
                }
                // Gender
                HStack {
                    Text("Gender:")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Male")
                        .font(.title2)
                }
                // Age
                HStack {
                    Text("Age:")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("25")
                        .font(.title2)
                }
                // Height
                HStack {
                    Text("Height:")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("5'10\"")
                        .font(.title2)
                }
                // Body Fat %
                HStack {
                    Text("Current BF Percentage:")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("25%")
                        .font(.title2)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
