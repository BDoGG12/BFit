//
//  LaunchView.swift
//  BFit
//
//  Created by Ben Do on 11/19/25.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        VStack {
            NavigationView(content: {
                VStack {
                    // Welcome message and app icon display
                    VStack {
                        Text("Welcome to BFit,")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("Your fitness companion!")
                            .font(.title)
                            .fontWeight(.bold)
                        Image("app_icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                    }
                    
                    // Authentication Selection Buttons
                    NavigationLink("Sign Up", destination: SignUpView())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                    NavigationLink("Login", destination: LoginView())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(.gray)
                        .cornerRadius(10)
                }
            })
        }
       
    }
}

#Preview {
    LaunchView()
}
