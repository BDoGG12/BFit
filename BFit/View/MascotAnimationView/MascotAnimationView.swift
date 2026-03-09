//
//  MascotAnimationView.swift
//  BFit Calculator
//
//  Created by Ben Do on 3/9/26.
//

import SwiftUI

struct MascotAnimationView: View {
    @State private var floating = false
    var imageName: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .offset(y: floating ? -8 : 8)
                .frame(width: 200, height: 200)
                .animation(.easeInOut.repeatForever(autoreverses: true), value: floating)
        }
        .onAppear(perform: {
            floating = true
        })
    }
}

#Preview {
    MascotAnimationView(imageName: "bfit_mascot")
}
