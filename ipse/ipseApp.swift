import SwiftUI

@main
struct ipseApp: App {
    let persistenceController = PersistenceController.shared

    @State
    var navigationViewModel = NavigationViewModel()
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(navigationViewModel)
        }
    }
}
