//
//  LogoView.swift
//  DailyFallacy
//
//  Created by Sötnos on 12.4.2021.
//

import SwiftUI


struct LogoView: View {
    
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        
        HStack {
            
//            Image("logo-text")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 60, height: 60, alignment: .center)
//            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
        } // : HSTACK
    }
}
// MARK: - PREVIEW
struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
