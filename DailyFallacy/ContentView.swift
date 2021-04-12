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
    @EnvironmentObject var library: Library
    
    // MARK: - BODY
    var body: some View {
        
        ZStack {
            if library.showingFallacy == false && library.selectedFallacy == nil {
                VStack(spacing: 0) {
                    
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
    
                    Spacer()
           
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack(spacing: 1) {
                            ForEach(fallacies) { item in
                                FallacyRowView(fallacy: item)
                                    .onTapGesture {
                                        withAnimation(.easeOut) {
                                            library.selectedFallacy = item
                                            library.showingFallacy = true
                                        }
                                    }
                                 } // : LOOP
                            .padding()
                        } //: LAZYVSTACK
                    } //: SCROLLVIEW
                }
            } else {
                FallacyDetailView()
            } //: VSTACK
        } // : ZSTACK
        .ignoresSafeArea(.all, edges: .top)
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fallacies: fallacyData)
            .environmentObject(Library())
    }
}
