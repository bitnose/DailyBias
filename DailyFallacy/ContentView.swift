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
    
    // MARK: - BODY
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                
                NavigationBarView()
                    .padding()
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                
                
                Spacer()
                
                FallacyShowView(fallacy: fallacies[0])
                
                ScrollView {
                    LazyVStack(spacing: 1) {
                        
                        ForEach(fallacies) { item in
                            
    //                        NavigationLink(destination: FallacyDetailView(fallacy: item)) {
    //                            FallacyRowView(fallacy: item)
    //
    //                        } //: NAVIGATION LINK
    //                        .buttonStyle(PlainButtonStyle())
                        }
                    } //: LAZYVSTACK
                } //: SCROLLVIEW
               
                .navigationTitle("Daily Bias")
                .navigationBarTitleDisplayMode(.inline)
            
            } //: VSTACK
        } // : ZSTACK
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fallacies: fallacyData)
    }
}
