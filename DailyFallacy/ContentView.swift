//
//  ContentView.swift
//  DailyFallacy
//
//  Created by Sötnos on 3.4.2021.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @EnvironmentObject var library: Library
  
    
    // MARK: - BODY
    var body: some View {
        
        ZStack {

            // MARK: - FALLACY VIEW
            if library.dailyFallacyDone == true && library.showingFallacy == true && library.selectedFallacy != nil {
                FallacyDetailView()
                
            // MARK: - FALLACY SHOW
            } else if library.dailyFallacyDone == false {
                FallacyShowView()
                
            // MARK: - CONTENT VIEW
            } else {
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
                            ForEach(library.fallacies) { item in
                                
                              
                                
                                FallacyRowView(fallacy: item)
                                    .onTapGesture {
                                        withAnimation(.easeOut) {
                                            library.selectedFallacy = item
                                            library.showingFallacy = true
                                        }
                                    }
                                Divider()
                                    .padding(.horizontal)
                                
                                 } // : LOOP
                           
                        } //: LAZYVSTACK
                    } //: SCROLLVIEW
                    
                    Button(action: {
                        
                        library.updateDailyFallacy()
                        library.dailyFallacyDone = false
                        
                    }, label: {
                        
                          Text("NEW BIAS")
                            .foregroundColor(.blue)
                            .font(.system(size: 12, weight: .light, design: .monospaced))
                            .underline(true, color: Color.blue)
  
                    })
                    .padding(.bottom, 20)
                }  //: VSTACK
            } // ELSE
            
            
           
        } // : ZSTACK
        .ignoresSafeArea(.all, edges: .top)
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Library())
    }
}


/*
 Home View
 - If showing the fallacy is false
 - if there are no selected fallacy
 - if dailyFallacyDone is true
 
 Fallacy Show
 - if dailyFallacyDone is false
 
 Detail View
 - If showing the fallacy is false
 - if there are no selected fallacy

 
 */


