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
                .overlay(
                    Image("Studio Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 65)
                )
            
            Text(item.title)
                .matchedGeometryEffect(id: item.title, in: namespace, properties: .position)
                .font(.system(size: 50))
                .padding()
            
            Text(item.description)
                .font(.body)
                .padding()
        }
        .cornerRadius(16)
    }
}

struct DetailView_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        DetailView(item: Item(title: "STRATEGY", color: Color("Purple"), description: "Solving problems and crafting solutions that make your business grow. \n\nWe make digital products, not just software, so we begin every project with Product Strategy Sprints to define problems, visualize solutions, and scope an Agile development plan."), namespace: namespace)
    }
}

struct Item: Hashable {
    let id = UUID()
    let title: String
    let color: Color
    let description: String
}

