//
//  FallacyShowView.swift
//  DailyFallacy
//
//  Created by Sötnos on 8.4.2021.
//

import SwiftUI

struct FallacyShowView: View {

    // MARK: - PROPERTIES
    @EnvironmentObject var library: Library
    
    // MARK: - BODY
    var body: some View {
        
            VStack(alignment: .center, spacing: 20) {
                    
                VStack {
                    // LOGO
                    Text("DAY \(library.dailyFallacy.orderNumber + 1)")
                        .font(.system(size: 11, weight: .light, design: .monospaced))
                        .underline(true, color: Color.black)

                    // IMAGE
                    Image("logo")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                } //: VSTACK
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    
                // THE TAB CONTENT
                TabView {

                    VStack {

                        // THE FIRST VIEW : TITLE + IMAGE
                        Text(library.dailyFallacy.title.uppercased())
                            .font(.system(size: 18, weight: .medium, design: .monospaced))

                        Spacer()
                        
                        Image(library.dailyFallacy.image)
                            .resizable()
                            .scaledToFit()
                            .padding()
                        
                        Spacer()
                        
                    } // : VSTACK

                    // EXAMPLES
       
                    VStack{
                    
                        ForEach(library.dailyFallacy.examples.prefix(3), id: \.self) { item in

                            Text(item)
                                .font(.system(size: 14, weight: .light, design: .rounded))
                                .foregroundColor(.white)
                                .padding()
                                .multilineTextAlignment(.leading)
                                .lineLimit(4)
                                .background(Color.black)
                                .clipShape(ExampleBubble())
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 2, x: 2, y: 2)
                                .frame(width: 300, alignment: .leading)
                            
                           
                        } // : LOOP
                    }
                   // ANSWERS
                    
                    VStack(alignment: .trailing) {
                    ForEach(library.dailyFallacy.wrappedAnswer.prefix(3), id: \.self) { item in

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
     
                    // SHORT DESCRIPTION
                    Text(library.dailyFallacy.shortDescription)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 14, weight: .light, design: .rounded))
                        .padding()
                    
                    // ALIASES
                    Text("""
                        Also called:

                        \(library.dailyFallacy.aliases[0])
                        \(library.dailyFallacy.aliases[1])
                        """)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 14, weight: .light, design: .rounded))
                    
                    // LONG DESCRIPTION
                    ForEach(library.dailyFallacy.longDescription.components(separatedBy: "."), id: \.self) { item in

                        Text(item)
                            .font(.system(size: 14, weight: .light, design: .rounded))
                            .padding()
                            .multilineTextAlignment(.center)
                        }
                    
                    // CATEGORIES
                    VStack {
                        ForEach(library.dailyFallacy.categories, id: \.self) { item in
                            CategoryCellView(category: item)
                        } // : LOOP
                    } //: VSTACK
                    
                    
                    // FINAL STATEMENT
                    VStack {
                        
                        // Nice Image
                        
                        Text("""
                        Great job!

                        You learnt a new fallacy!

                    """)
                            .font(.system(size: 14, weight: .light, design: .rounded))
                            .padding()
                            .multilineTextAlignment(.center)
                            
                        
                        Button(action: {
                            // Go to detail view
                            withAnimation(.easeOut) {
                                library.selectedFallacy = library.dailyFallacy
                                library.showingFallacy = true
                                library.dailyFallacyDone = true
                                library.addNewFallacy(fallacy: library.dailyFallacy)
                                
                            }
                        }, label: {
                            Text("NEXT")
                                .font(.system(size: 14, weight: .light, design: .rounded))
                                .padding()
                        }) //: BUTTON
                        
                        
                    }
                    
                } // : TABVIEW
                    .padding()
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))

                // SKIP Button
                Button(action: {
                    // Go to detail view
                    withAnimation(.easeOut) {
                        library.selectedFallacy = library.dailyFallacy
                        library.addNewFallacy(fallacy: library.dailyFallacy)
                        library.showingFallacy = true
                        library.dailyFallacyDone = true
                       
                       
                        // Update the dailyFallacy property
                        
                        
                        
                    }
                }, label: {
                    Text("SKIP")
                        .font(.system(size: 12, weight: .light, design: .rounded))
                        .foregroundColor(.secondary)
                        .padding()
                }) //: BUTTON
                }
         
        }
    
    
}

// MARK: - PREVIEW
struct FallacyShowView_Previews: PreviewProvider {
    static var previews: some View {
        FallacyShowView()
            .environmentObject(Library())
    }
}
