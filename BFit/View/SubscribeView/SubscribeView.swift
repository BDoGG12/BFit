//
//  SubscribeView.swift
//  BFit Calculator
//
//  Created by Ben Do on 12/14/25.
//

import SwiftUI
import RevenueCat
import RevenueCatUI

struct SubscribeView: View {
    @State private var displayPawwall: Bool = false
    var body: some View {
        VStack {
            Button("Subscribe") {
                displayPawwall = true
            }
            .font(.title)
            .buttonStyle(.borderedProminent)
            .frame(width: 200, height: 50)
            .sheet(isPresented: $displayPawwall) {
                PaywallView()
            }
        }
    }
}

#Preview {
    SubscribeView()
}
