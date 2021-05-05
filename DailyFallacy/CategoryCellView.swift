//
//  CategoryCellView.swift
//  DailyFallacy
//
//  Created by Sötnos on 12.4.2021.
//

import SwiftUI

struct CategoryCellView: View {
    
    // MARK: - PROPERTIES
    var category: Category
    
    // MARK: - BODY
    var body: some View {
        
       ZStack {
            
        Text(category.name.uppercased())
            .font(.system(size: 12, weight: .light, design: .monospaced))
            .padding()
            .multilineTextAlignment(.center)
            .lineLimit(2)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 0.3)
                        .frame(width: 250, height: 50, alignment: .center)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 2, x: 2, y: 2)
                )
            
            Image(category.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: .center)
                .background(
                    Circle()
                        .fill(Color.white)
                        .frame(width:
                                60, height: 60, alignment: .center)
                )
                .offset(x: -110, y: -20)
                
        } // : ZSTACK
       .padding()
    }
}

// MARK: - PREVIEW
struct CategoryCellView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCellView(category: categories[0])
        
            
    }
}
