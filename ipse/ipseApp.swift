//
//  ipseApp.swift
//  ipse
//
//  Created by Maxwell Altman on 2/24/24.
//

import SwiftUI

@main
struct ipseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
