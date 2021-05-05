//
//  DailyFallacyApp.swift
//  DailyFallacy
//
//  Created by Sötnos on 3.4.2021.
//

import SwiftUI

@main
struct DailyFallacyApp: App {

    @StateObject var library = Library()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(library)
               
        }
    }
}
