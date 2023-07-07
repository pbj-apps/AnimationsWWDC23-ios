//
//  ContentView.swift
//  CustomScreenTransitionDemo
//
//  Created by Pierre-Antoine Fagniez on 06/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            ListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListView: View {
    let items = (1...15).map { _ in Item() }
    @Namespace private var namespace
    @State private var selectedItem: Item?

    var body: some View {
        VStack {
            if let selectedItem {
                DetailView(item: selectedItem, namespace: namespace)
                    .matchedGeometryEffect(id: selectedItem, in: namespace)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            self.selectedItem = nil
                        }
                    }
            } else {
                ScrollView {
                    ForEach(items, id: \.self) { item in
                        Button(action: {
                            withAnimation(.spring()) {
                                selectedItem = item
                            }
                        }) {
                            Text(item.title)
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(item.color)
                                .cornerRadius(8)
                                .padding(.horizontal)
                                .matchedGeometryEffect(id: item, in: namespace)
                        }
                    }
                }
            }
        }
    }
}
