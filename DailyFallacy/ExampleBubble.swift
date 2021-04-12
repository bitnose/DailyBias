//
//  ExampleBubble.swift
//  DailyFallacy
//
//  Created by Sötnos on 4.4.2021.
//

import SwiftUI


struct ExampleBubble : Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, .bottomRight], cornerRadii: CGSize(width: 15, height: 15))
        return Path(path.cgPath)
    }
}


