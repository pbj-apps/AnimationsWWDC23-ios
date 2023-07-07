//
//  Tree.swift
//  Animations WWDC 2023
//
//  Created by Pierre-Antoine Fagniez on 16/06/2023.
//

import SwiftUI

struct Tree: View {
    let petalNumber: Int
    
    init() {
        petalNumber = Int.random(in: 5...8)
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.brown)
                .frame(width: 20, height: 80)
            
            RadialLayout(radius: 20, rotation: .zero) {
                ForEach(0 ..< petalNumber) { _ in
                    leaf
                }
                .padding(.bottom, 70)
            }
        }
    }
    
    var leaf: some View {
        Circle()
            .fill(.darkGreen)
            .frame(width: 50, height: 50)
            .phaseAnimator([true, false]) { view, phase in
                view
                    .scaleEffect(phase ? CGFloat.random(in: 1...1.4) : CGFloat.random(in: 0.5...0.8))
            } animation: { phase in
                    .easeInOut(duration: CGFloat.random(in: 0...8))
            }
    }
}

#Preview {
    Tree()
}
