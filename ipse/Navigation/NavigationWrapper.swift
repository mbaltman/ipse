import SwiftUI

struct NavigationWrapper: View {
    @State private var selection: Int = 0
    // Assuming equal spacing and square size for simplicity
    private let squareSize: CGFloat = 20
    private let labels = ["1", "2", "3"]

    var body: some View {
        VStack(spacing: 0) {
            // Pages
            TabView(selection: $selection) {
                Text("Page 1")
                    .tag(0)
                Text("Page 2")
                    .tag(1)
                Text("Page 3")
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            // Custom Navigation Bar with Moving Square
            ZStack(alignment: .bottom) {
                HStack {
                    ForEach(0..<3) { index in
                        Spacer()
                        Text(labels[index])
                            .font(.headline)
                            .foregroundColor(selection == index ? .blue : .gray)
                            .onTapGesture {
                                withAnimation {
                                    selection = index
                                }
                            }
                        Spacer()
                    }
                }
                .padding(.bottom, squareSize) // Make space for the moving square

                // Moving Square
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: squareSize, height: squareSize)
                    .offset(x: calculateOffset(), y: 0)
                    .animation(.easeInOut, value: selection)
            }
            .frame(height: 50) // Adjust the frame height as needed
            .background(Color(.systemBackground))
            .edgesIgnoringSafeArea(.bottom)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    // Calculate the offset for the square based on the current selection
    private func calculateOffset() -> CGFloat {
        // Calculate the total width of the HStack
        let totalWidth = UIScreen.main.bounds.width - 40 // Adjust based on padding
        // Calculate the width per segment
        let segmentWidth = totalWidth / CGFloat(labels.count)
        // Calculate offset
        return (CGFloat(selection) * segmentWidth) - (totalWidth / 2) + (segmentWidth / 2)
    }
}

struct NavigationWrapper_Previews: PreviewProvider {
    static var previews: some View {
        NavigationWrapper()
    }
}
