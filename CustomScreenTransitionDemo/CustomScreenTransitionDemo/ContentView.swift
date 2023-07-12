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
    let items = [
        Item(title: "STRATEGY", color: Color("Purple"), description: "Solving problems and crafting solutions that make your business grow. \n\nWe make digital products, not just software, so we begin every project with Product Strategy Sprints to define problems, visualize solutions, and scope an Agile development plan."),
        Item(title: "DESIGN", color: Color("Red"), description: "Engaging users with beautiful design \n\nIn a crowded market, beautiful designs communicate to users how seriously you take their attention. In tandem with our product strategists, product designers work tirelessly to inspire users with original branding, human-centric experience design, and dynamic animations."),
        Item(title: "ENGINEERING", color: Color("MidBlue"), description: "Scaling your business with enterprise-class code\n\nThe Studio engineering teams translate our product designs into functional code on web, iOS, and Android. Whether you need a responsive web app or an iPhone application, our full-stack team will deliver documented, extensible code."),
        Item(title: "GROWTH", color: Color("DarkBlue"), description: "We think about growth as a diverse toolkit – not an individual channel.\n\nWe create and execute strategies to scale your company to the next level and define clear & measurable growth targets to keep team members aligned on the metrics that matter.")
    ]
    @Namespace private var namespace
    @State private var selectedItem: Item?
    @State private var isHeaderExpended: Bool = false
    
    @State private var isListLayout = true
    
    var body: some View {
        VStack {
            if isHeaderExpended {
                extendedHeader
            } else {
                retractedHeader

            }
            
            if isListLayout {
                ScrollView {
                    ForEach(items, id: \.self) { item in
                        Button(action: {
                            withAnimation(.easeInOut) {
                                selectedItem = item
                            }
                        }) {
                            Text(item.title)
                                .matchedGeometryEffect(id: item.title, in: namespace, properties: .position)
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 180)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                    .fill(item.color)
                                    .matchedGeometryEffect(id: item.color, in: namespace)
                                )
                                .padding(.horizontal)
                        }
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
