import SwiftUI

struct NavigationWrapper: View {
    @State private var selection: Int = 0
    // Assuming equal spacing and square size for simplicity
    private let squareSize: CGFloat = 100
    private let segmentSize = 80.0
    
    var body: some View {
        VStack(spacing: 0) {
            // Pages
            TabView(selection: $selection) {
                CheckInView()
                    .tag(0)
                Text("Page 2")
                    .tag(1)
                Text("Page 3")
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            // Custom Navigation Bar with Moving Square
            ZStack(alignment: .bottom) {
                // Moving Square
                Rectangle()
                    .fill(Color("ipseRed"))
                    .cornerRadius(5)
                    .frame(width: squareSize, height: squareSize)
                    .offset(x: calculateOffset(), y: 0)
                    .animation(.easeInOut, value: selection)
                
                HStack() {
                    Spacer()
                    VStack
                    {
                        Image(systemName: "square.and.pencil")
                            .font(Font.system(size: 40))
                            .foregroundColor(Color("ipseWhite"))
                        Text("CheckIn")
                            .font(Constants.bodyFont)
                            .foregroundStyle(Color("ipseBlack"))
                    }
                    .frame(width: segmentSize)
                    .onTapGesture {
                        selection = 0
                    }
                    Spacer()

                    VStack
                    {
                        Image(systemName: "chart.xyaxis.line")
                            .font(Font.system(size: 40))
                            .foregroundColor(Color("ipseWhite"))
                        Text("Data")
                            .font(Constants.bodyFont)
                            .foregroundStyle(Color("ipseBlack"))

                    }
                    .frame(width: segmentSize)
                    .onTapGesture {
                        selection = 1
                    }
                    Spacer()
                    
                    VStack
                    {
                        Image(systemName: "gearshape")
                            .font(Font.system(size: 40))
                            .foregroundColor(Color("ipseWhite"))
                        Text("Settings")
                            .font(Constants.bodyFont)
                            .foregroundStyle(Color("ipseBlack"))
                    }
                    .frame(width: segmentSize)
                    .onTapGesture {
                        selection = 2
                    }
                    Spacer()

                }
                .padding(.bottom, 20)
               
            }
            .frame(width: UIScreen.main.bounds.width, height: 90) // Adjust the frame height as needed
            .background(Color("ipseRed_secondary"))
            .edgesIgnoringSafeArea(.bottom)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    // Calculate the offset for the square based on the current selection
    private func calculateOffset() -> CGFloat {
        
        let spacing = (UIScreen.main.bounds.width - segmentSize * 3 ) / 4

        switch selection
        {
        case 0:
            return -( spacing + segmentSize)
        case 1:
            return 0
        case 2:
            return (spacing + segmentSize)
        default:
            return 0
        }
    }
}

struct NavigationWrapper_Previews: PreviewProvider {
    static var previews: some View {
        NavigationWrapper()
    }
}
