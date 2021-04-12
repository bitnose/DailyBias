//
//  NavigationBarView.swift
//  DailyFallacy
//
//  Created by Sötnos on 12.4.2021.
//

import SwiftUI

struct NavigationBarView: View {
    
    // MARK: - VARIABLES
    @State private var isAnimated : Bool = false
    
    // MARK: - BODY
    var body: some View {
        HStack {
            
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .font(.headline)
                    .foregroundColor(.black)
            }) //: SEARCH BUTTON
            Spacer()
            
            LogoView()
                .opacity(isAnimated ? 1 : 0)
                .offset(x: 0, y: isAnimated ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimated.toggle()
                    }
                })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "text.justifyright")
                    .font(.headline)
                    .foregroundColor(.black)
            }) //: SETTINGS BUTTON
            
            
        } //: HSTACK
    }
}
// MARK: - PREVIER
struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
