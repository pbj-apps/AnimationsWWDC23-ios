//
//  KeyframeAnimationsDemo.swift
//  Animations WWDC 2023
//
//  Created by Pierre-Antoine Fagniez on 13/06/2023.
//

import SwiftUI

struct Keyframe {
    var scale: CGFloat = 1
    var offsetY: CGFloat = 0
}

struct KeyFrameExempleView: View {
    
    @State var enableAnimation = false
    
    //Keyframes are predefined animations. They animate values that are applied to the view.
    //It's best to avoid running expensive operations during a Keyframe animation because the view will be refreshed on every frame
    
    var body: some View {
        VStack {
            Spacer()
        
            Circle()
                .fill(.orange)
                .frame(width: 200, height: 200)
                .overlay(Image(systemName: "globe").resizable().frame(width: 200, height: 200))
                .keyframeAnimator(initialValue: Keyframe(), trigger: enableAnimation) { view, frame in
                    view
                        .scaleEffect(y: frame.scale)
                        .offset(y: frame.offsetY)
                } keyframes: { frame in
                    KeyframeTrack(\.offsetY) {
                        LinearKeyframe(250, duration: 0.5)
                        SpringKeyframe(.zero, duration: 0.5, spring: .bouncy)
                        LinearKeyframe(250, duration: 0.3)
                        LinearKeyframe(150, duration: 0.3)
                        SpringKeyframe(200, duration: 0.3, spring: .bouncy)
                    }
                    KeyframeTrack(\.scale) {
                        CubicKeyframe(1, duration: 0.3)
                        LinearKeyframe(0.5, duration: 0.2)
                        LinearKeyframe(1, duration: 0.6)
                        LinearKeyframe(0.7, duration: 0.2)
                        SpringKeyframe(1, duration: 0.2, spring: .bouncy)
        
                    }
                }
        
            Spacer()
        
            Button("Toggle Animation") {
                enableAnimation.toggle()
            }
            .fontWeight(.bold)
            .padding(.bottom, 80)
        }
    }
}

#Preview {
    KeyFrameExempleView()
}

//VStack {
//    Spacer()
//
//    Circle()
//        .fill(.orange)
//        .frame(width: 200, height: 200)
//        .overlay(Image(systemName: "globe").resizable().frame(width: 200, height: 200))
//        .keyframeAnimator(initialValue: Keyframe(), trigger: enableAnimation) { view, frame in
//            view
//                .scaleEffect(y: frame.scale)
//                .offset(y: frame.offsetY)
//        } keyframes: { frame in
//            KeyframeTrack(\.offsetY) {
//                CubicKeyframe(250, duration: 0.5)
//                SpringKeyframe(.zero, duration: 0.5, spring: .bouncy)
//                CubicKeyframe(250, duration: 0.3)
//                CubicKeyframe(150, duration: 0.3)
//                SpringKeyframe(200, duration: 0.3, spring: .bouncy)
//            }
//            KeyframeTrack(\.scale) {
//                CubicKeyframe(1, duration: 0.3)
//                SpringKeyframe(0.5, duration: 0.2, spring: .bouncy)
//                SpringKeyframe(1, duration: 0.6, spring: .bouncy)
//                SpringKeyframe(0.7, duration: 0.2, spring: .bouncy)
//                SpringKeyframe(1, duration: 0.2, spring: .bouncy)
//
//            }
//        }
//
//    Spacer()
//
//    Button("Toggle Animation") {
//        enableAnimation.toggle()
//    }
//    .fontWeight(.bold)
//    .padding(.bottom, 80)
//}
