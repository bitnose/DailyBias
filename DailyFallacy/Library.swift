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
    @Published var dailyFallacyDone: Bool = false
    @Published var dailyFallacy: Fallacy = fallacyData[0]
    @Published var counter: Int = 0
    @Published private(set) var fallacies : [Fallacy]
    static let saveKey = "SavedData"
    
    // This way the whole rest of your code doesn’t have to worry about Core Data’s optionality, and if you want to make changes to default values you can do it in a single file.
    var wrappedFallacy: Fallacy {
        selectedFallacy ?? fallacyData[0]
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
            if let decoded = try? JSONDecoder().decode([Fallacy].self, from: data) {
                self.fallacies = decoded
                return
            }
        }
        self.fallacies = []
    }
 
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(fallacies) {
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        }
    }
    
    
    // MARK: - METHODS
    func increment() {
        
        print("The level of the progress: \(counter)")
        counter+=1
        dailyFallacy = fallacyData[counter]
        print("The new level of the progress: \(counter)")

    }
 
    func addNewFallacy(fallacy: Fallacy) {
        
        if fallacies.contains(fallacy) {
            print("Fallacy exists already")
        } else {
            fallacies.append(fallacy)
            print("New fallacy added.")
            save()
        }
    }
    
    func updateDailyFallacy() {
        
        let currentDay = dailyFallacy.orderNumber
    
        if currentDay<fallacyData.count-1 {
            dailyFallacy = fallacyData[currentDay+1]
        } else {
            print("No fallacies left!")
        }
    }
    
    // Create a function that adds +1 to the fallacy calculator
    
    
}
