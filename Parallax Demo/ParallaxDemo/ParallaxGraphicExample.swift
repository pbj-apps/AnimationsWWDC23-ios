//
//  ParallaxExampleView.swift
//  Collapsable Header
//
//  Created by Pierre-Antoine Fagniez on 31/07/2023.
//

import SwiftUI

struct ParallaxGraphicExample: View {
    var body: some View {
        ZStack {
            ParallaxScrolling {
                ZStack(alignment: .bottom) {
                    Color.gray
                        .frame(width: UIScreen.main.bounds.width * 5, height: 150)
                        .overlay {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 50))
                                    .foregroundColor(.white)
                                
                                Text("Scroll Left")
                                    .font(.system(size: 50))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding(.leading, 10)
                        }
                    
                    VStack {
                        Spacer()
                        ZStack(alignment: .leading) {
                            Image("2cv")
                                .resizable()
                                .rotationEffect(Angle(degrees: 90))
                                .frame(width: 300, height: 380)
                            
                        }
                    }
                }
            }
            .background(.blue.opacity(0.4))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ParallaxGraphicExample_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxGraphicExample()
    }
}

struct ParallaxScrolling<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ZStack(alignment: .bottomLeading) {
                GeometryReader { proxy in
                    cloudBackground
                        .frame(maxWidth: UIScreen.main.bounds.width * 5)
                        .offset(x: -proxy.frame(in: .global).origin.x / 1.5)
                    
                    treeBackground
                        .frame(maxWidth: UIScreen.main.bounds.width * 5)
                        .offset(x: -proxy.frame(in: .global).origin.x / 2, y: -50)
                }
                
                content
                
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    var treeBackground: some View {
        VStack {
            Spacer()
            ZStack {
                HStack {
                    ForEach(0 ..< 100) { _ in
                        Rectangle()
                            .fill(.brown)
                            .frame(width: 60, height: 350)
                            .overlay(
                                Image(systemName: "triangle.fill")
                                    .resizable()
                                    .foregroundColor(.green)
                                    .frame(width: 100, height: 350)
                                    .padding(.bottom, 300)
                            )
                            .padding(.trailing, 40)
                    }
                }
                .padding(.bottom, 40)
            }
        }
    }
    
    var cloudBackground: some View {
        VStack {
            HStack {
                ForEach(0 ..< 100) { _ in
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 50, height: 50)
                            .padding(.leading, 30)
                            .padding(.top, 40)
                        
                            Circle()
                                .fill(.white)
                                .frame(width: 50, height: 50)
                                .padding(.leading, 80)
                                .padding(.top, 50)
                        
                        Circle()
                            .fill(.white)
                            .frame(width: 80, height: 80)
                            .padding(.leading, 70)
                        Circle()
                            .fill(.white)
                            .frame(width: 60, height: 60)
                    }
                }
            }
            .padding(.top, 80)
            Spacer()
        }
    }
}
