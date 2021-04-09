//
//  AnswerBubble.swift
//  DailyFallacy
//
//  Created by Sötnos on 8.4.2021.
//

import SwiftUI

struct AnswerBubble : Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, .bottomLeft], cornerRadii: CGSize(width: 15, height: 15))
        return Path(path.cgPath)
    }
    
}
