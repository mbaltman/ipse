import SwiftUI

struct ContinueButton: View {
    var action: () -> Void
    var width: CGFloat // Dynamic width
    var height: CGFloat // Dynamic height
    @State private var isPressed = false

    var body: some View {
        // Outer container for shadow, dynamically sizes to the button
        Button(action: {
            self.action()
        }) {
            Text("Continue")
                .font(Constants.bodyFont)
                .foregroundColor(Color("ipseBlack"))
                .padding()
                .frame(width: width, height: height) // Use dynamic width and height
                .background(Color("ipseRed"))
                .cornerRadius(Constants.buttonRounding)
                .offset(x: isPressed ? 5 : 0, y: isPressed ? 5 : 0) // Only move the button content
                .animation(.easeOut(duration: 0.2), value: isPressed)
        }
        .background(
            Color("Background")
                .cornerRadius(Constants.buttonRounding)
                .shadow(color: Color("ipseBlack"), radius: 0, x: 5, y: 5)
        )
        .buttonStyle(FlatStyle()) // Custom button style to disable default animations
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged({ _ in isPressed = true })
                .onEnded({ _ in isPressed = false })
        )
    }

    // Custom Button Style to disable the default press animation
    struct FlatStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
        }
    }
}
