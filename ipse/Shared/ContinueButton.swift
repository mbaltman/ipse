import SwiftUI

// Define a separate View for the ContinueButton
struct ContinueButton: View {
    var action: () -> Void
    @State private var isPressed = false // Tracks whether the button is being pressed

    var body: some View {
        // Outer container for shadow
        ZStack {
            // Invisible spacer for shadow alignment
            Color("Background")
                .frame(width: 100, height: 100)
                .cornerRadius(Constants.buttonRounding)
                .shadow(color: Color("ipseBlack"), radius: 0, x: 5, y: 5)
            
            // Actual button content
            Button(action: action) {
                Text("Continue")
                    .padding()
                    .font(Constants.bodyFont)
                    .foregroundColor(Color("ipseBlack"))
                    // Apply background here for the button content only
                    .background(Color("ipseRed").cornerRadius(Constants.buttonRounding))
                    // Apply offset to the button content
                    .offset(x: isPressed ? 5 : 0, y: isPressed ? 5 : 0)
            }
            .buttonStyle(FlatStyle()) // Use the custom button style to disable default animations
        }
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
