//
//  FallacyDetailView.swift
//  DailyFallacy
//
//  Created by Sötnos on 4.4.2021.
//

import SwiftUI

struct FallacyDetailView: View {
    
    // MARK: - PROPERTIES
    @EnvironmentObject var library: Library
    
    // MARK: - BODY
    var body: some View {
        
        VStack {
            
            // NAV BAR
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            // SCROLL
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .center, spacing: 20) {
       
                    // HEADER
                    FallacyHeaderView(fallacy: library.wrappedFallacy)
                    
                    VStack(alignment: .center, spacing: 15) {
                
                        // TITLE
                        Text(library.wrappedFallacy.title.uppercased())
                           
                            .font(.system(size: 18, weight: .medium, design: .monospaced))
                       //     .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.1), radius: 1, x: 1, y: 1)
                            .multilineTextAlignment(.center)
                        
                        // SHORT
                        Text(library.wrappedFallacy.shortDescription)
                            .font(.system(size: 12, weight: .light, design: .rounded))
                            .multilineTextAlignment(.leading)
                        
                        // EXAMPLES
 
                        VStack(alignment: .leading) {
                                ForEach(library.wrappedFallacy.examples.prefix(3), id: \.self) { item in

                                        Text(#"\#(item)"#)
                                            
                                            .fontWeight(.regular)
                                            .font(.system(size: 12, weight: .light, design: .rounded))
                                            .foregroundColor(.white)
                                            .padding()
                                            .lineLimit(4)
                                            .background(Color.black)
                                            .clipShape(ExampleBubble())
                                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 2, x: 2, y: 2)
                                }
                            } //: VSTACK
                            .padding()
                        

                        
                        // ALIASES
                        
                        // CATEGORIES
                        
                        Text("LEARN MORE...")
                            .foregroundColor(.blue)
                            .font(.system(size: 12, weight: .medium, design: .monospaced))
                            .padding()
                           
                        // LONG
                        Text(library.wrappedFallacy.longDescription)
                            .font(.system(size: 12, weight: .thin, design: .rounded))
                            .multilineTextAlignment(.leading)
                            .padding()
                        
                        
                        // CATEGORIES
                        VStack(alignment: .center) {

                            ForEach(library.wrappedFallacy.categories, id: \.self) { item in
                                CategoryView(category: item)
                            }// : LOOP
                        } //: VSTACK
                        .padding(.bottom, 20)
                        
                    } //: VSTACK
                   
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                }//: VSTACK
            } //: SCROLL
        } //: VSTACK
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct FallacyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FallacyDetailView()
            .environmentObject(Library())
    }
}
