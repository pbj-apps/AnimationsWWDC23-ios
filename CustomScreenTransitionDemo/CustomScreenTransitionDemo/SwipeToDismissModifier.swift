//
//  SwipeToDismissModifier.swift
//  CustomScreenTransitionDemo
//
//  Created by Pierre-Antoine Fagniez on 12/07/2023.
//

import SwiftUI

struct SwipeToDismissModifier: ViewModifier {
    
    @State private var offset: CGSize = .zero
    var onDismiss: () -> Void

    func body(content: Content) -> some View {
        content
            .offset(y: offset.height)
            .animation(.interactiveSpring(), value: offset)
            .simultaneousGesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                    }
                    .onEnded { _ in
                        if abs(offset.height) > 200 {
                            onDismiss()
                        } else {
                            offset = .zero
                        }
                    }
            )
    }
}

extension View {
    func swipeToDismiss(onDismiss: @escaping () -> Void) -> some View {
        modifier(SwipeToDismissModifier(onDismiss: onDismiss))
    }
}

