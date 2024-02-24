import SwiftUI

struct Battery: View {
    
    static let increments = 10
    static let segmentWidth: CGFloat = 24 // Width of one segment
    static let spacing: CGFloat = 5 // Spacing between segments
    static let padding: CGFloat = 22 // Horizontal padding
    static let totalWidth: CGFloat = CGFloat(increments) * segmentWidth + CGFloat(increments - 1) * spacing + 2 * padding
    
    @State private var selectedValue: Int = -1
    
    var logValue: (Int)-> Void
    var body: some View {
        
        HStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center, spacing: 5) {
                ForEach(0..<Battery.increments + 1) { index in
                    let highlighted = index <= selectedValue
                    
                    ZStack
                    {
                        Rectangle()
                            .fill(Color(highlighted ? "ipseRed" : "ipseRed_secondary")) // Use your color names
                            .frame(width: Battery.segmentWidth, height: 72)
                            .cornerRadius(5)
                        Rectangle()
                            .fill(Color(highlighted ? "ipseGreen" : "ipseRed_secondary")) // Use your color names
                            .frame(width: Battery.segmentWidth, height: 72)
                            .opacity(Double(index) * 0.1)
                            .cornerRadius(5)
                    }
                  
                }
            }
            .padding(EdgeInsets(top: 15, leading: Battery.padding, bottom: 15, trailing: Battery.padding))
            .background(Color("ipseBlack")) // Use your color name
            .cornerRadius(10)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        // Calculate which segment the drag is in
                        let totalSegments = Battery.increments
                        let position = value.location.x - Battery.padding // Adjust based on starting position
                        
                        // Calculate the selected segment based on the drag position
                        let segment = max(0, min(totalSegments, Int(floor(position / (Battery.segmentWidth + Battery.spacing)))))
                        selectedValue = segment
                        logValue(selectedValue)
                    }
            )
            
            Rectangle()
                .fill(Color("ipseBlack")) // Use your color name
                .frame(width: 20, height: 50)
                .clipShape(RoundedRightCornersShape(radius: 10))
        }
    }
}
    
    struct RoundedRightCornersShape: Shape {
        var radius: CGFloat
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            // Start from the top left corner
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            // Line to the top right, start of the rounding
            path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY))
            
            // Top right rounded corner
            path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.minY + radius),
                        radius: radius,
                        startAngle: Angle(degrees: -90),
                        endAngle: Angle(degrees: 0),
                        clockwise: false)
            
            // Line to the bottom right, start of the rounding
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - radius))
            
            // Bottom right rounded corner
            path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius),
                        radius: radius,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 90),
                        clockwise: false)
            
            // Close the path by linking back to the start
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.closeSubpath()
            
            return path
        }
    }

