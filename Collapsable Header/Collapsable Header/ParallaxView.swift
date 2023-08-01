//
//  ParallaxView.swift
//  Collapsable Header
//
//  Created by Pierre-Antoine Fagniez on 01/08/2023.
//

import SwiftUI

struct ParallaxView: View {
    var body: some View {
        ParallaxScrollView {
            VStack {
                Text("Parallax Example")
                    .font(.system(size: 40))
                    .padding(.bottom, 20)
                
                Text(loremIpsum)
                    .font(.system(size: 17))
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct ParallaxView_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxView()
    }
}

struct ParallaxScrollView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack {
                GeometryReader { proxy in
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .scaleEffect(2)
                        .blur(radius: 1)
                        .opacity(0.6)
                        .offset(y: -proxy.frame(in: .global).origin.y / 2)
                }
                
                content
            }
            .ignoresSafeArea()
        }
    }
}
