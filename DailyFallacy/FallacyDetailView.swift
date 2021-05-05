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
                
                VStack(spacing: 20) {
       
                    // IMAGE
                    FallacyHeaderView(fallacy: library.wrappedFallacy)
                    
                    VStack(spacing: 15) {
                
                        // TITLE
                        Text(library.wrappedFallacy.title.uppercased())
                           
                            .font(.system(size: 18, weight: .medium, design: .monospaced))
                       //     .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.1), radius: 1, x: 1, y: 1)
                            .multilineTextAlignment(.center)
                        
                      
                           
                        
                        
                        // SHORT
                        Text(library.wrappedFallacy.shortDescription)
                            .font(.system(size: 14, weight: .light, design: .rounded))
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 20)
                            .padding(.top, 20)
                            
                       
                        
                        // EXAMPLES
 
                        VStack(alignment: .leading) {
                                ForEach(library.wrappedFallacy.examples.prefix(3), id: \.self) { item in

                                        Text(#"\#(item)"#)
                                            
                                            .font(.system(size: 14, weight: .light, design: .rounded))
                                            .foregroundColor(.white)
                                            .padding()
                                            .lineLimit(4)
                                            .background(Color.black)
                                            .clipShape(ExampleBubble())
                                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 2, x: 2, y: 2)
                            }
                        } //: VSTACK
                            .frame(width: 300, alignment: .leading)
                   
                        // ANSWERS
                        VStack(alignment: .trailing) {
                        ForEach(library.wrappedFallacy.wrappedAnswer.prefix(3), id: \.self) { item in

                            Text(#"\#(item)"#)

                                .font(.system(size: 14, weight: .light, design: .rounded))
                                .foregroundColor(.white)
                                .padding()
                                .lineLimit(4)
                                .background(Color.blue)
                                .clipShape(AnswerBubble())
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 2, x: 2, y: 2)

                            }
                            
                        } //: VSTACK
                            .frame(width: 300, alignment: .trailing)
                      
 
                        Spacer()
                        
    
                   
                        
                        Text("LEARN MORE...")
                            .foregroundColor(.blue)
                            .font(.system(size: 14, weight: .medium, design: .monospaced))
                            .padding()
                           
                        // LONG
                        Text(library.wrappedFallacy.longDescription)
                            .font(.system(size: 14, weight: .thin, design: .rounded))
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                        
                       
                        
                        // ALIASES
                        VStack(alignment: .center) {
                            
                            Text("ALSO KNOWN AS:")
                                .foregroundColor(.blue)
                                .font(.system(size: 14, weight: .medium, design: .monospaced))
                                .padding(.bottom, 10)
                               
                            
                            ForEach(library.wrappedFallacy.aliases, id: \.self) { item in

                                Text(#"\#(item)"#)
                                    .font(.system(size: 14, weight: .thin, design: .rounded))
                                    .foregroundColor(.black)
                                    
                            }
                        } //: VSTACK
                        .padding()
                        
                        Text("AFFECTS ON...")
                            .foregroundColor(.blue)
                            .font(.system(size: 14, weight: .medium, design: .monospaced))
                            .padding(.top, 30)
                           
                        
                        
                        
                        // CATEGORIES
                        VStack(alignment: .center) {

                            ForEach(library.wrappedFallacy.categories, id: \.self) { item in
                                CategoryCellView(category: item)
                                   
                                    
                            }// : LOOP
                        } //: VSTACK
                        
                        
                    } //: VSTACK
                   
                    .padding(.horizontal, 25)
                    .padding(.bottom, 20)
                }//: VSTACK
            } //: SCROLL
            .padding(.bottom, 30)
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
