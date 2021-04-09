//
//  Category.swift
//  DailyFallacy
//
//  Created by Sötnos on 9.4.2021.
//

import SwiftUI

// MARK: - Category


struct Category: Identifiable, Hashable {
    let id = UUID()
    let name : String
    let description: String
//  let color: String
    let image: String
}
