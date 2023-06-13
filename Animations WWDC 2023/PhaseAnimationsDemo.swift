//
//  PhaseAnimationsDemo.swift
//  Animations WWDC 2023
//
//  Created by Pierre-Antoine Fagniez on 13/06/2023.
//

import SwiftUI

struct PhaseAnimatorExempleView: View {
    
    //USed for chained animations
    //When the view appears, the first phase is active (False in this case), then SwiftUI transition to the next phase
    
    @State var toggleAnimation = false
    
    var body: some View {
       
        VStack {
            Spacer()
            twoStates
            Spacer()
            twoStatesAdvanced
            Spacer()
            multipleStatePhaseWithTrigger
            Spacer()
            
            
            Button("Toggle Animation") {
                toggleAnimation.toggle()
            }
            .fontWeight(.bold)
            .padding(.bottom, 80)
        }
    }
    
    var twoStates: some View {
        Image(systemName: "exclamationmark.triangle.fill")
            .resizable()
            .frame(width: 100, height: 100)
            .symbolRenderingMode(.palette)
            .phaseAnimator([false, true]) { content, phase in
                content
                    .opacity(phase ? 1 : 0.5)
                    .foregroundStyle(.white, phase ? .red : .orange)
            }
    }
    
    var twoStatesAdvanced: some View {
        Image(systemName: "exclamationmark.triangle.fill")
            .resizable()
            .frame(width: 100, height: 100)
            .symbolRenderingMode(.palette)
            .phaseAnimator([false, true]) { content, phase in
                content
                    .opacity(phase ? 1 : 0.5)
                    .foregroundStyle(.white, phase ? .red : .orange)
            } animation: { phase in
                    .easeInOut(duration: 1)
            }
    }
    
    var multipleStatePhaseWithTrigger: some View {
        Text("👆")
            .font(.system(size: 100))
            .phaseAnimator(Phase.allCases, trigger: toggleAnimation) { content, phase in
                content
                    .offset(y: phase.verticalOffset)
                    .scaleEffect(phase.scale)
            } animation: { phase in
                switch phase {
                case .initial: .smooth
                case .move: .easeInOut(duration: 0.3)
                case .scale: .spring(duration: 0.3, bounce: 0.7)
                }
            }
    }
}

#Preview {
    PhaseAnimatorExempleView()
}

enum Phase: CaseIterable {
    case initial, move, scale
    
    var verticalOffset: Double {
        switch self {
        case .initial: 0
        case .move, .scale: -60
        }
    }
    
    var scale: Double {
        switch self {
        case .initial, .move: 1
        case .scale: 0.5
        }
    }
}
