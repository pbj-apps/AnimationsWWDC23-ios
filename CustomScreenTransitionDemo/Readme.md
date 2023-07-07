
# Elegant Transition between screens

In this tutorial, you will learn how to create a smooth transition between two views

## Create the Item Model

Let's start by creating the Item model that represents each item in the list. It includes simple properties like a random title, color, and description.

```swift
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
```

## Set up the Initial View

Let's create the initial view, which displays a list of items. Each item in the list will have a button that triggers the transition to a detailed view.


```swift
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            ListView()
        }
    }
}

struct ListView: View {
    let items = (1...15).map { _ in Item() }
    @State private var selectedItem: Item?

    var body: some View {
        VStack {
            ScrollView {
                ForEach(items, id: \.self) { item in
                    Button(action: {
                        withAnimation(.spring()) {
                            selectedItem = item
                        }
                    }) {
                        Text(item.number)
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(item.color)
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                }
            }
        }
    }
}
```

<img src="https://github.com/pbj-apps/AnimationsWWDC23-ios/assets/12393850/117a1644-dd77-48e2-830c-c11815dd4bd2" width="295" height="639" />

## Create the Detail View

Now, let's create the DetailView that displays the details of a selected item.

```swift 
struct DetailView: View {
    let item: Item

    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 15)
                .fill(item.color)
                .padding()
            
            Text(item.title)
                .font(.system(size: 50))
                .padding()
            
            Text(item.description)
                .font(.body)
                .padding()
        }
        .background()
        .cornerRadius(16)
    }
}
```
<img src="https://github.com/pbj-apps/AnimationsWWDC23-ios/assets/12393850/29ccce32-1f17-45be-af47-593c909350ad" width="295" height="639" />

## Add the Transition

Now that we have everything setup, we can implement the transition. To do this, we first need to add a ```@Namespace ``` which is simply a view property that links views together. 

```swift
struct ListView: View {
    let items = (1...15).map { _ in Item() }
    @Namespace private var namespace
    @State private var selectedItem: Item?

    var body: some View {
        ...
    }
```
In the detail view, you need to add ```Namespace.ID``` which is a reference to the Namespace created in the parent view.

```swift
struct DetailView: View {
    let item: Item
    let namespace: Namespace.ID

    var body: some View {
        ...
    }
```

Once it's done, add a ```.matchedGeometryEffect(id: identifier, in: namespace)``` to all the views that should be part of the transition. The identifier should be unique allowing SwiftUI to transition between one layout to another.

```swift
struct ListView: View {
    let items = (1...15).map { _ in Item() }
    @Namespace private var namespace
    @State private var selectedItem: Item?

    var body: some View {
        VStack {
            if let selectedItem {
                DetailView(item: selectedItem, namespace: namespace)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .matchedGeometryEffect(id: selectedItem, in: namespace)
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
```

Once an item is selected, we hide the list to display its detail view. SwiftUI will now make a spring animation as defined in the ```onTapGesture```.

<img src="https://github.com/pbj-apps/AnimationsWWDC23-ios/assets/12393850/a25d3296-f029-4b45-982c-c2b0136b8fd6" width="295" height="639" />
