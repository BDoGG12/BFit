//
//  ContentView.swift
//  BFit
//
//  Created by Ben Do on 11/9/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
                SelectionMenuView()
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
