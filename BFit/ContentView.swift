//
//  ContentView.swift
//  BFit
//
//  Created by Ben Do on 11/9/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                HomeView()
            }
            Tab("Calculator", systemImage: "plus.forwardslash.minus") {
                UserInputView()
            }
            Tab("Profile", systemImage: "person.fill") {
                ProfileView()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
