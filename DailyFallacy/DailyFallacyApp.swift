//
//  DailyFallacyApp.swift
//  DailyFallacy
//
//  Created by Sötnos on 3.4.2021.
//

import SwiftUI

@main
struct DailyFallacyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
