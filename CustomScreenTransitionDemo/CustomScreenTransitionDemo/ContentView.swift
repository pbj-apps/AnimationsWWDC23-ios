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
        ZStack {
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
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(item.color)
                                    .mask({
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(item.color)
                                            .matchedGeometryEffect(id: item.color, in: namespace)
                                    })
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            if let selectedItem {
                DetailView(item: selectedItem, namespace: namespace)
                    .matchedGeometryEffect(id: selectedItem, in: namespace)
                    .frame(maxWidth: .infinity)
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
            Image(systemName: "star.circle")
                .font(.system(size: 50))
                .matchedGeometryEffect(id: "icon", in: namespace)
            
            VStack(alignment: .leading) {
                Text("Item list")
                    .font(.system(size: 30))
                    .matchedGeometryEffect(id: "title", in: namespace)
                
                Text("Tap to read more")
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
            Image(systemName: "star.circle")
                .font(.system(size: 100))
                .matchedGeometryEffect(id: "icon", in: namespace)
            
            Text("Item list")
                .font(.system(size: 40))
                .matchedGeometryEffect(id: "title", in: namespace)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non nibh varius odio auctor blandit. Quisque sollicitudin massa justo. Fusce consequat erat ac quam lobortis finibus. Pellentesque lorem lacus, mattis id aliquet a, dapibus et lorem. Integer ultrices pellentesque purus, non iaculis nisi consequat eu.")
                .font(.system(size: 15))
            
        }
        .onTapGesture {
            withAnimation(.easeIn) {
                isHeaderExpended.toggle()
            }
        }
        .padding()
    }
}

extension View {
    func swipeToDismiss(onDismiss: @escaping () -> Void) -> some View {
        modifier(SwipeToDismissModifier(onDismiss: onDismiss))
    }
}

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
