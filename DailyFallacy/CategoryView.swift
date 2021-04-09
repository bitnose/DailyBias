//
//  CategoryView.swift
//  DailyFallacy
//
//  Created by Sötnos on 9.4.2021.
//

import SwiftUI

struct CategoryView: View {
    
    let category: Category
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        
        
        
        
        ZStack(alignment: .bottom) {
            
            Image(category.image)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 60)
                .offset(x: -100)
                .padding(.bottom, 20)
                
                
                      
            
            Text(category.name)
                .foregroundColor(.black)
                .font(.system(size: 12, weight: .light, design: .monospaced))
                .padding()
                .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.secondary, lineWidth: 0.5)
                            .frame(width: 250, height: 40, alignment: .center)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 2, x: 2, y: 2)
            )
        } //: HSTACK
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: categories[0])
    }
}
