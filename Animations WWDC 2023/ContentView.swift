//
//  ContentView.swift
//  Animations WWDC 2023
//
//  Created by Pierre-Antoine Fagniez on 13/06/2023.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: .studioPurple)
                
                VStack(spacing: 25) {
                    NavigationLink {
                        KeyFrameExempleView()
                    } label: {
                        Text("Keyframes")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundStyle(Color.white)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8).stroke(.white, lineWidth: 1.0)
                            )
                    }
                    
                    NavigationLink {
                        PhaseAnimatorExempleView()
                    } label: {
                        Text("Phase Animation")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundStyle(Color.white)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8).stroke(.white, lineWidth: 1.0)
                            )
                    }
                }
                
                VStack {
                    Spacer()
                    Image(.studioLogo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(30)
                }
            }
            .ignoresSafeArea()
        }
        .tint(.studioPurple)
    }
}

#Preview {
    ContentView()
}
