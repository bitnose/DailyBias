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
    var answer: [String]?
   // var categories: [Category]
    
    
    
    
    
    // Start a counter and add +1 each day --> Use this to show the correct data!
    
}

