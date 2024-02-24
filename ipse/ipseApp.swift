import SwiftUI

@main
struct ipseApp: App {
    let persistenceController = PersistenceController.shared

    @State
    var navigationViewModel = NavigationViewModel()
    
    var body: some Scene {
        WindowGroup {
            let traits = UserDefaultsManager.retrieveSelectedTraits()
            let times = UserDefaultsManager.retrieveSelectedTimes()
            
            if times.isEmpty || traits.isEmpty
            {
                OnboardingView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(navigationViewModel)
            }
            else
            {
                NavigationWrapper()
            }
          
        }
    }
}
