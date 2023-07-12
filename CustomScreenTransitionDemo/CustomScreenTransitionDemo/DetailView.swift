//
//  DetailView.swift
//  CustomScreenTransitionDemo
//
//  Created by Pierre-Antoine Fagniez on 06/07/2023.
//

import SwiftUI

struct DetailView: View {
    let item: Item
    let namespace: Namespace.ID

    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 15)
                .fill(item.color)
                .matchedGeometryEffect(id: item.color, in: namespace)
                .padding()
            
            Text(item.title)
                .matchedGeometryEffect(id: item.title, in: namespace, properties: .position)
                .font(.system(size: 50))
                .padding()
                .transition(.scale(scale: 1))
            
            Text(item.description)
                .font(.body)
                .padding()
        }
        .background()
        .cornerRadius(16)
    }
}

struct DetailView_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        DetailView(item: Item(), namespace: namespace)
    }
}

struct Item: Hashable {
    let id = UUID()
    let title: String = "Item \(Int.random(in: 0...999))"
    let color = randomColor()
    let description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non nibh varius odio auctor blandit. Quisque sollicitudin massa justo. Fusce consequat erat ac quam lobortis finibus. Pellentesque lorem lacus, mattis id aliquet a, dapibus et lorem. Integer ultrices pellentesque purus, non iaculis nisi consequat eu. Maecenas fringilla ex placerat, viverra massa sed, lacinia turpis. In in ullamcorper eros. Quisque malesuada non quam viverra sollicitudin. Praesent semper massa id finibus finibus. Maecenas in laoreet quam."
}

func randomColor() -> Color {
    let red = Double.random(in: 0...1)
    let green = Double.random(in: 0...1)
    let blue = Double.random(in: 0...1)
    return Color(red: red, green: green, blue: blue)
}
