//
//  Landscaper.swift
//  Animations WWDC 2023
//
//  Created by Pierre-Antoine Fagniez on 16/06/2023.
//

import SwiftUI

struct Landscaper: View {
    
    var body: some View {
        ZStack {
            sky
            
            earth
        }
        .ignoresSafeArea()
    }
    
    var sky: some View {
        ZStack {
            Color.darkBlue
            
            Color.blue
                .phaseAnimator(DayCycle.allCases) { view, phase in
                    view
                        .opacity(phase.skyBrightness)
                } animation: { phase in
                    switch phase {
                    case .sunrise: .linear(duration: 2)
                    case .noon: .linear(duration: 10)
                    case .dawn: .linear(duration: 2)
                    case .midnight: .linear(duration: 10)
                    }
                }
            
            LinearGradient(colors: [Color.orange.opacity(0.9), Color.orange.opacity(0)], startPoint: .bottom, endPoint: .top)
                .frame(height: 350)
                .padding(.bottom, 200)
                .phaseAnimator(DayCycle.allCases) { view, phase in
                    view
                        .opacity(phase.lowSunColors)
                } animation: { phase in
                    switch phase {
                    case .sunrise: .linear(duration: 6)
                    case .noon: .linear(duration: 6)
                    case .dawn: .linear(duration: 6)
                    case .midnight: .linear(duration: 6)
                    }
                }
            
            RadialLayout(radius: 155, rotation: Angle(degrees: 260)) {
                sun
                moon
            }
            .keyframeAnimator(initialValue: DayCycleKeyFrame()) { view, frame in
                view
                    .rotationEffect(Angle(degrees: frame.rotation))
            } keyframes: { frame in
                KeyframeTrack(\.rotation) {
                    LinearKeyframe(360, duration: 24)
                }
            }
        }
    }
    
    var earth: some View {
        VStack {
            Spacer()
            
            Color.green
                .frame(height: 450)
                .overlay {
                    ZStack {
                        ForEach(1 ..< 15) {_ in
                            let yOffset = CGFloat.random(in: -130...190)
                            Tree()
                                .offset(
                                    x: CGFloat.random(in: -200...200),
                                    y: yOffset)
                                .zIndex(yOffset)
                        }
//                        Tree()
//                            .offset(x: -100, y: -50)
//                        Tree()
//                            .offset(x: 140, y: 80)
//                        Tree()
//                            .offset(x: 80, y: 20)
//                        Tree()
//                            .offset(x: -130, y: 50)
//                        Tree()
//                            .offset(x: 90, y: -120)
                    }
                }
                .overlay {
                    Color.black
                        .phaseAnimator(DayCycle.allCases) { view, phase in
                            view
                                .opacity(phase.landDarkness)
                        } animation: { phase in
                            switch phase {
                            case .sunrise: .linear(duration: 2)
                            case .noon: .linear(duration: 10)
                            case .dawn: .linear(duration: 2)
                            case .midnight: .linear(duration: 10)
                            }
                        }
                }
        }
    }

    var sun: some View {
        Image(systemName: "sun.min.fill")
            .foregroundStyle(.yellow)
            .font(.system(size: 80))
            .shadow(color: .yellow, radius: 40)
            .shadow(color: .yellow, radius: 40)
            .shadow(color: .red, radius: 40)
    }

    var moon: some View {
        Image(systemName: "moon.fill")
            .foregroundStyle(.white)
            .font(.system(size: 80))
            .shadow(color: .white, radius: 40)
            .shadow(color: .yellow, radius: 40)
    }
}

#Preview {
    Landscaper()
}

struct DayCycleKeyFrame {
    var rotation: CGFloat = 0
}


enum DayCycle: CaseIterable {
    case sunrise
    case noon
    case dawn
    case midnight
    
    var skyBrightness: Double {
        switch self {
        case .sunrise: 0.5
        case .noon: 1
        case .dawn: 0.5
        case .midnight: 0
        }
    }
    
    var lowSunColors: CGFloat {
        switch self {
        case .sunrise: 0.5
        case .noon: 0
        case .dawn: 0.5
        case .midnight: 0
        }
    }
    
    var landDarkness: Double {
        switch self {
        case .sunrise: 0.3
        case .noon: 0
        case .dawn: 0.3
        case .midnight: 0.6
        }
    }
}
