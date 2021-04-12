//
//  FallacyShowView.swift
//  DailyFallacy
//
//  Created by Sötnos on 8.4.2021.
//

import SwiftUI

struct FallacyShowView: View {
    
    
    // MARK: - PROPERTIES
    var fallacy: Fallacy
    
    // MARK: - BODY
    var body: some View {

            
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                    
                    // THE DATE
                    Text("DAY \(fallacy.orderNumber)")
                        .font(.system(size: 11, weight: .light, design: .monospaced))
                        .underline(true, color: Color.black)
                        
     
                    
                    
                    // THE TAB CONTENT
                    TabView{
                        
                        
                        VStack {
                            ForEach(fallacy.categories, id: \.self) { item in

                                CategoryView(category: item)
                                
                                    
                            } //: VSTACK
                            
                        }
                            
                        
                        VStack {
                            
                            
                            
                            Text(fallacy.title.uppercased())
                                .font(.system(size: 18, weight: .light, design: .monospaced))
                                
                            
                            Spacer()
                            
                            Image(fallacy.image)
                                .resizable()
                                .scaledToFit()
                                .padding()
                            
                            Spacer()
                            
                           
                        } // : VSTACK
                             
                       
                        
                        // THIRD: EXAMPLES

                        ForEach(fallacy.examples.prefix(3), id: \.self) { item in

                            Text(item)
                                .fontWeight(.regular)
                                .font(.system(size: 12, weight: .light, design: .rounded))
                                .foregroundColor(.white)
                                .padding()
                                .multilineTextAlignment(.leading)
                                .lineLimit(4)
                                .background(Color.black)
                                .clipShape(ExampleBubble())
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 2, x: 2, y: 2)
                        }
                        
                        // FOURTH SET: SHORT
                          Text(fallacy.shortDescription)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 14, weight: .light, design: .rounded))
                        
                        // FIFTH: ALIAS
                        Text("Some synonyms... \(fallacy.aliases[0]), \(fallacy.aliases[1]) ")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 14, weight: .light, design: .rounded))
                        
                        
                        // SIXTH: LONG
                        ForEach(fallacy.longDescription.components(separatedBy: "."), id: \.self) { item in

                            Text(item)
                                .font(.system(size: 12, weight: .light, design: .rounded))
                                .padding()
                                .multilineTextAlignment(.center)
                            }
                        
                        // ANSWER
                        

                        ForEach(fallacy.wrappedAnswer.prefix(3), id: \.self) { item in

                            Text(item)
                                .fontWeight(.regular)
                                .font(.system(size: 12, weight: .light, design: .rounded))
                                .foregroundColor(.white)
                                .padding()
                                .multilineTextAlignment(.trailing)
                                .lineLimit(4)
                                .background(Color.blue)
                                .clipShape(AnswerBubble())
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 2, x: 2, y: 2)
                                
                                
                        }
                        
                        
                        
                        
                        
     
                        } // : TABVIEW
               
                    .padding()
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
                    
      
                    
                // SKIP Button
                NavigationLink(destination: FallacyDetailView(fallacy: fallacy)) {
                    Text("SKIP")
                        .font(.system(size: 12, weight: .light, design: .rounded))
                        .foregroundColor(.secondary)
                }
                    
                    
                                   
            
            } //: VSTACK
            
            
            
        } // : NAVIGATIONVIEW

        .navigationBarTitle("")
        
        .navigationBarHidden(true)

        
       
    }
    
}

struct FallacyShowView_Previews: PreviewProvider {
    static var previews: some View {
        FallacyShowView(fallacy: fallacyData[1])
    }
}
