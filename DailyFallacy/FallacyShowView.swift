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
            
            // IMAGE
            
            
            
            VStack {
                
                // THE DATE
                Text("DAY \(fallacy.orderNumber)")
                    .font(.system(size: 18, weight: .light, design: .monospaced))
 
                // THE TAB CONTENT
                TabView{
                        
                    // FIRST
                        Image(fallacy.image)
                            .resizable()
                            .scaledToFit()
                            .padding()
                        
                    // SECOND
                    Text(fallacy.title)
                        .font(.system(size: 18, weight: .light, design: .monospaced))
                    
                    // THIRD

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
                    
                    // FOURTH SET
                      Text(fallacy.shortDescription)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 14, weight: .light, design: .rounded))
                    
                    } // : TABVIEW
           
                .padding()
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
  
                
                
                
                
                
                               
            } //: VSTACK
        } // : NAVIGATIONVIEW
       
        .navigationBarTitle(fallacy.title, displayMode: .automatic)
        .ignoresSafeArea()
    }
    
}

struct FallacyShowView_Previews: PreviewProvider {
    static var previews: some View {
        FallacyShowView(fallacy: fallacyData[1])
    }
}
