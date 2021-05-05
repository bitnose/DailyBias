//
//  FallacyRowView.swift
//  DailyFallacy
//
//  Created by Sötnos on 4.4.2021.
//

import SwiftUI

struct FallacyRowView: View {
    
    // MARK: - PROPERTIES
    var fallacy: Fallacy
    
    // MARK: - BODY
    var body: some View {
        
        HStack {

            VStack(alignment: .center, spacing: 2) {
   
                Image(fallacy.image)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 50, alignment: .center)
             
                Text(fallacy.title.uppercased())
                    .fontWeight(.thin)
                    .font(.system(size: 14))
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.1), radius: 1, x: 1, y: 1)
                    .padding()

                Text(fallacy.shortDescription)
                    .fontWeight(.thin)
                    .font(.system(size: 9))
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
            } // : VSTACK
            .padding(30)
        } //: HSTACK  
    }
}

// MARK: - PREVIEW
struct FallacyRowView_Previews: PreviewProvider {
    static var previews: some View {
        FallacyRowView(fallacy: fallacyData[0])
        
    }
}
