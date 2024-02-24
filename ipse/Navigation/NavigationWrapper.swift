import SwiftUI

struct NavigationWrapper: View {
    var body: some View {
        TabView {
            Text("Page 1")
                .tag(0)
            Text("Page 2")
                .tag(1)
            Text("Page 3")
                .tag(2)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        // Use this to allow gestures to work even on the edge of the screen
        .edgesIgnoringSafeArea(.all)
    }
}
