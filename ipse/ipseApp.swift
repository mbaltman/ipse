import SwiftUI

@main
struct ipseApp: App {
    let persistenceController = PersistenceController.shared
    
    @ObservedObject
    var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
          
            if !appState.isOnboarded
            {
                OnboardingView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(appState)
                    .transition( .opacity)
                
            }
            else
            {
                NavigationWrapper()
                    .environmentObject(appState)
                    .onAppear(perform: appState.loadInReports)
                    .transition( .opacity)
            }
        }
    }
}
