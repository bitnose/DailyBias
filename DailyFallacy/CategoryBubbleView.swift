//
//  CategoryBubbleView.swift
//  DailyFallacy
//
//  Created by Sötnos on 10.4.2021.
//

import SwiftUI

struct CategoryBubbleView: View {
    
    
    var body: some View {
        
        Path { path in
            
            path.move(to: CGPoint(x: 100, y: 0))
            path.addLine(to: CGPoint(x: 300, y: 0))
            path.addLine(to: CGPoint(x: 300, y: 80))
            path.addLine(to: CGPoint(x: 50, y: 80))
            path.addLine(to: CGPoint(x:50, y: 60))
            path.addLine(to: CGPoint(x:50, y: 60))
            }
        
        .stroke(Color.secondary, style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
        .padding()
    }
}

struct CategoryBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryBubbleView()
    }
}

struct CategoryBubble : Shape {
  //  let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 100, y: 0))
        path.addLine(to: CGPoint(x: 300, y: 0))
        path.addLine(to: CGPoint(x: 300, y: 80))
        path.addLine(to: CGPoint(x: 50, y: 80))
        path.addLine(to: CGPoint(x:50, y: 60))
        path.addLine(to: CGPoint(x:50, y: 60))
            
        return path
    }

    
    
}
