//
//  ContentView.swift
//  CustomScreenTransitionDemo
//
//  Created by Pierre-Antoine Fagniez on 06/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
            ListView()
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
    @State private var isHeaderExpended: Bool = false
    
    var body: some View {
        VStack {
            if isHeaderExpended {
                extendedHeader
            } else {
                retractedHeader
                
            }
            
            ScrollView {
                ForEach(items, id: \.self) { item in
                    Button(action: {
                        withAnimation(.easeInOut) {
                            selectedItem = item
                        }
                    }) {
                        ZStack {
                            Text(item.title)
                                .matchedGeometryEffect(id: item.title, in: namespace, properties: .position)
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                    .fill(item.color)
                                    .matchedGeometryEffect(id: item.color, in: namespace)
                                )
                        }
                        .padding(.horizontal)
                    }
                }
            }

        }.overlay {
            if let selectedItem {
                DetailView(item: selectedItem, namespace: namespace)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .swipeToDismiss {
                        withAnimation(.spring()) {
                            self.selectedItem = nil
                        }
                    }
            }
        }
    }
    
    var retractedHeader: some View {
        HStack {
            Image("Studio Icon")
                .resizable()
                .matchedGeometryEffect(id: "icon", in: namespace)
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Image("Studio Logo Dark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(height: 30)
                
                Text("Tap to discover")
                    .font(.system(size: 20))
            }
            
            Spacer()
        }
        .onTapGesture {
            withAnimation(.easeOut) {
                isHeaderExpended.toggle()
            }
        }
        .padding()
    }
    
    var extendedHeader: some View {
        VStack {
            Image("Studio Icon")
                .resizable()
                .matchedGeometryEffect(id: "icon", in: namespace)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            Image("Studio Logo Dark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "title", in: namespace)
                .frame(height: 50)
            
                Text("Bring new digital products to market and transform existing offerings with Studio. \n \nWe help startups and enterprise clients accelerate their product development plans with innovative strategy, beautiful design, world-class engineering, and product-led growth.")
                    .font(.system(size: 16))
                    .padding(.top)
            
        }
        .onTapGesture {
            withAnimation(.easeIn) {
                isHeaderExpended.toggle()
            }
        }
        .padding()
    }
}
