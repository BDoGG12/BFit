//
//  ContentView.swift
//  BFit
//
//  Created by Ben Do on 11/9/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to BFit!")
                    .font(.largeTitle)
                    .bold()
                Image("AppIcon")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .padding()
                NavigationLink("Log In", destination: LoginView())
                Text("Or")
                    .bold()
                    .padding()
                NavigationLink("Sign Up", destination: SignUpView())
            }
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
