import SwiftUI

@main
struct ipseApp: App {
    let persistenceController = PersistenceController.shared
    
    let appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            let traits = UserDefaultsManager.retrieveSelectedTraits()
            let times = UserDefaultsManager.retrieveSelectedTimes()
            
            if times.isEmpty || traits.isEmpty
            {
                OnboardingView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            else
            {
                NavigationWrapper()
                    .environmentObject(appState)
                    .onAppear(perform: appState.loadInReports)
            }
        }
    }
}
