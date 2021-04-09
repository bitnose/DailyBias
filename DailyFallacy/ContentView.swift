//
//  ContentView.swift
//  DailyFallacy
//
//  Created by Sötnos on 3.4.2021.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    var fallacies: [Fallacy] = fallacyData
    
    
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>

    // MARK: - BODY
    var body: some View {
        
        NavigationView {
            
            FallacyShowView(fallacy: fallacies[0])
            
            ScrollView {
                LazyVStack(spacing: 1) {
                    
                    ForEach(fallacies) { item in
                        
                        NavigationLink(destination: FallacyDetailView(fallacy: item)) {
                            FallacyRowView(fallacy: item)
       
                        } //: NAVIGATION LINK
                        .buttonStyle(PlainButtonStyle())
                    }
                } //: LAZYVSTACK
            } //: SCROLLVIEW
           
            .navigationTitle("Fallacy")
            .navigationBarTitleDisplayMode(.inline)
           
                    
        } //: NAVIGATION
      
        
      
            
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fallacies: fallacyData)
    }
}
