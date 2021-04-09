//
//  Fallacy.swift
//  DailyFallacy
//
//  Created by Sötnos on 3.4.2021.
//

import SwiftUI

// MARK: - FALLACY MODEL

struct Fallacy: Identifiable {
    
    var id = UUID()
    var title : String
    var shortDescription: String
    var longDescription: String
    var examples: [String]
    var image: String
    var orderNumber: Int
    var aliases : [String]
    var opposite: [Fallacy]
    var answers: [String]?
    var categories: [Category]
    
    // This way the whole rest of your code doesn’t have to worry about Core Data’s optionality, and if you want to make changes to default values you can do it in a single file.
    var wrappedAnswer: [String] {
        answers ?? ["No answer for this one.."]
    }
    
    
    
    
    
    // Start a counter and add +1 each day --> Use this to show the correct data!
    
}

