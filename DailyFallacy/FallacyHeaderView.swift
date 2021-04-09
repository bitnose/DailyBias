//
//  FallacyHeaderView.swift
//  DailyFallacy
//
//  Created by Sötnos on 4.4.2021.
//

import SwiftUI

struct FallacyHeaderView: View {
    
    // MARK: - PROPERTIES
    var fallacy: Fallacy
    @State private var isAnimatingImage: Bool = false
    
    // MARK: - BODY
    var body: some View {
        
        ZStack{
            
            Image(fallacy.image)
                .resizable()
                .scaledToFit()
              //  .frame(maxHeight: 300)
                .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
   
        }//: ZSTACK
        .frame(height: 300)
        .onAppear() {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimatingImage = true
            }
        }
    }
}

struct FallacyHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FallacyHeaderView(fallacy: fallacyData[0])
    }
}
