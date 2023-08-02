//
//  ContentView.swift
//  Collapsable Header
//
//  Created by Pierre-Antoine Fagniez on 27/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Spacer()
            NavigationLink(destination: ParallaxView(), label: {
                button(title: "Parallax View")
            })
            Spacer()
            NavigationLink(destination: ParallaxGraphicExample(), label: {
                button(title: "Parallax Graphic Example")
            })
            Spacer()
        }
        .tint(Color("Purple"))
    }
    
    func button(title: String) -> some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color("Purple"))
            .frame(height: 150)
            .padding(.horizontal, 20)
            .overlay {
                Text(title)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
