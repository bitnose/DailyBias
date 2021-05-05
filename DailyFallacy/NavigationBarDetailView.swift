//
//  NavigationBarDetailView.swift
//  DailyFallacy
//
//  Created by Sötnos on 12.4.2021.
//

import SwiftUI

struct NavigationBarDetailView: View {
    
    // MARK: - PROPERTIES
    @EnvironmentObject var library: Library
    
    // MARK: - BODY
    var body: some View {
        HStack{
            
            Button(action: {
                
                withAnimation(.easeIn) {
                    library.selectedFallacy = nil
                    library.showingFallacy = false
                }
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.headline)
                    .foregroundColor(.black)
            }) // : BUTTON
                   
            Spacer()

            Button(action: {
                
                withAnimation(.easeIn) {
                    library.selectedFallacy = nil
                    library.showingFallacy = true
                    
                }
                
                
            }, label: {
                Image(systemName: "play.circle")
                    .font(.headline)
                    .foregroundColor(.black)
                
            }) // : BUTTON
        } // : HSTACK
    }
}
// MARK: - PREVIEW
struct NavigationBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarDetailView()
            .environmentObject(Library())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
