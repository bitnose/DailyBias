//
//  Library.swift
//  DailyFallacy
//
//  Created by Sötnos on 12.4.2021.
//

import Foundation


class Library : ObservableObject {
    
    @Published var showingFallacy: Bool = false
    @Published var selectedFallacy: Fallacy? = nil
    
    // This way the whole rest of your code doesn’t have to worry about Core Data’s optionality, and if you want to make changes to default values you can do it in a single file.
    var wrappedFallacy: Fallacy {
        selectedFallacy ?? fallacyData[0]
    }
    
}
