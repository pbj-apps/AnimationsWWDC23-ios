# Parallax Effect

## What is it

Before diving into the code, let's first understand what the parallax effect is. Parallax is an optical or visual phenomenon where objects appear to change their relative positions when viewed from different angles. In the context of design and user interfaces, parallax is often utilized to create depth and dimension by moving foreground and background elements at different speeds, thereby giving a sense of motion or a 3D effect.

If you want to read more about parallax, check out [this article by Robert Palmer](https://medium.com/@branded7/the-troublesome-misconception-of-parallax-in-web-design-2a55ad1459f7)

## Implementation

Creating this 3D effect of parallax is fairly simple. It involves moving the background of a scrolling screen at a different speed compared to the foreground.

Here's the code for a custom ScrollView with a parallax effect:

``` swift
struct ParallaxScrollView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack {
                GeometryReader { proxy in
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .scaleEffect(2)
                        .blur(radius: 1)
                        .opacity(0.6)
                        .offset(y: -proxy.frame(in: .global).origin.y / 2)
                }
                
                content
            }
            .ignoresSafeArea()
        }
    }
}
```

This view wraps all the content of the ```ScrollView``` in a ```ZStack``` because we want the content to overlay the background image.

To achieve the parallax effect, we need to offset the background based on the scroll position, but less than the content. Otherwise, the background image will scroll as fast as the content.
To do this, we wrap the background image inside a ```GeometryReader``` to obtain the coordinates of the current scroll position.
Then, we divide it by 2 (or any desired number) to control the effect. 
If you want the background to move more slowly than the foreground, add the minus sign, otherwise, remove it.

In the provided example, the background image is blurred and slightly transparent to avoid distracting the user from the main content of the view. It's better to use an image larger than the screen to ensure you can scroll through the content while still seeing the background scrolling slowly.

You can use like a regular ```ScrollView```

``` swift
struct ParallaxView: View {
    var body: some View {
        ParallaxScrollView {
            VStack {
                Text("Parallax Example")
                    .font(.system(size: 40))
                    .padding(.bottom, 20)
                
                Text(loremIpsum)
                    .font(.system(size: 17))
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }.edgesIgnoringSafeArea(.bottom)
    }
}
```

And here is the result 

![Simulator Screen Recording - iPhone 14 - 2023-08-01 at 16 04 12](https://github.com/pbj-apps/SwiftUIAnimationDemo-ios/assets/12393850/fa57ee55-0199-47e2-b4ac-3347652fe592)

### A step further

Parallax can be applied with more than two layers, resulting in a greater feeling of depth. To achieve this, ensure that all layers move at different speeds. In real life, elements further away in the background should move more slowly than those at the front.

Building upon the previous implementation, we can create a horizontal scrolling view with a parallax effect:

![Simulator Screen Recording - iPhone 14 - 2023-08-01 at 16 16 19](https://github.com/pbj-apps/SwiftUIAnimationDemo-ios/assets/12393850/ba93faf4-4422-408b-94c3-b794448c6f0a)


```swift
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
}
```
Instead of one background, we add an extra one that will move even more slowly than the first one. 

```swift
struct ParallaxScrolling<Content: View>: View {
    //... 
     var treeBackground: some View {
        VStack {
            Spacer()
            ZStack {
                HStack {
                    ForEach(0 ..< 100) { _ in
                    //Tree
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
                //Cloud
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
```

Once we have the Parallax scroll view with the 2 backgrounds setup, we can add the foreground, the gray road and the red car

```swift
struct ParallaxGraphicExample: View {
    var body: some View {
        ZStack {
            ParallaxScrolling {
                ZStack(alignment: .bottom) {
                //Road
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
                    //Car
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
```

## Conclusion

The parallax effect is a visually appealing technique that adds depth and dimension to user interfaces. By moving foreground and background elements at different speeds, it creates a sense of motion and a 3D-like experience.

With SwiftUI, implementing the parallax effect is straightforward. By using a custom ScrollView with a ZStack and a GeometryReader, we can achieve the desired parallax motion. Furthermore, we can extend the effect by incorporating multiple background layers moving at different speeds.

Adding a parallax effect to your user interfaces can enhance the user experience, making it more engaging and immersive. It is a powerful tool to add dynamism and excitement to your app's visual design.
