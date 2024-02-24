import SwiftUI

struct CircleImageButton: View {
    var action: () -> Void
    var title: String
    var iconImage: String
    
    @State private var isPressed = false

    var body: some View {
        // Outer container for shadow, dynamically sizes to the button
        VStack
        {
            Button(action: {
                self.action()
            }) {
                Image(systemName: iconImage)
                    .font(.system(size: 36)) // Increase the size of the system image
                    .foregroundColor(Color("ipseWhite")) // Set the image color to white
                    .padding()
                    .frame(width: 80, height: 80)
                    .background(Color("ipseRed"))
                    .cornerRadius(40)
                    .offset(x: isPressed ? 5 : 0, y: isPressed ? 5 : 0)
                    .animation(.easeOut(duration: 0.2), value: isPressed)
            }
            .background(
                Color("Background")
                    .cornerRadius(40)
                    .shadow(color: Color("ipseBlack"), radius: 0, x: 5, y: 5)
            )
            .buttonStyle(FlatStyle()) // Custom button style to disable default animations
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ _ in isPressed = true })
                    .onEnded({ _ in isPressed = false })
            )
            Text(title)
                .font(Constants.bodyFont)
                .foregroundColor(Color("ipseBlack"))
        }
      
    }

    // Custom Button Style to disable the default press animation
    struct FlatStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
        }
    }
}
