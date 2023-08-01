# Parallax Effect

## What is it

Before diving into the code, it would be better to know what we are talking about.
Parallax is an optical effect or visual phenomenon where objects appear to shift their position relative to each other when viewed from different angles. 
In the context of design and user interfaces, parallax is often used to create depth and dimension by moving foreground and background elements at different speeds, giving a sense of motion or 3D effect.

If you want to read more about parallax, check out [this article by Robert Palmer](https://medium.com/@branded7/the-troublesome-misconception-of-parallax-in-web-design-2a55ad1459f7)

## Implementation

Creating this 3D effect of parallax is fairly simple. It is all about making the background of a scrolling screen moving at a different speed from the foreground.

Here is the code for a custom ```ScrollView``` with a parallax effect

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

This view wraps all the content of the ```ScrollView``` in a ```ZStack``` as we want the ```content``` to overlay the background image.
If we don't give an offset to the background image, the image will scroll as fast as the content. 

We need to offset the background depending on the scroll position but less than the content.
For this reason, wrap the background image inside a ```GeometryReader```. It will provide the coordinates of the current scroll position which we then divide by 2 (or any number you want to match the desired effect). 
If you want the background to move more slowly than the foreground, add the minus sign, otherwise, remove it.

In this example, the background image is blurred and a bit transparent to not distract the eye of the user from the main content of the view. 
It's better to have an image bigger than the screen to make sure you can scroll through the content and still see the background scrolling slowly.

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
