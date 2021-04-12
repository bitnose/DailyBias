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
                
          
            
            // THE DATE

                Text("DAY \(library.wrappedFallacy.orderNumber)")
                    .font(.system(size: 11, weight: .light, design: .monospaced))
                    .underline(true, color: Color.black)
                    
                
                
                Image("logo")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .padding(.top, -15)

            .padding(.bottom, 10)

                    
            // THE TAB CONTENT
            TabView {

                VStack {
                    ForEach(library.wrappedFallacy.categories, id: \.self) { item in
                        CategoryView(category: item)
                    } // : LOOP
                } //: VSTACK

                VStack {

                    Text(library.wrappedFallacy.title.uppercased())
                        .font(.system(size: 18, weight: .light, design: .monospaced))

                    Spacer()
                    
                    Image(library.wrappedFallacy.image)
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    Spacer()
                    
                } // : VSTACK

                // EXAMPLES

                ForEach(library.wrappedFallacy.examples.prefix(3), id: \.self) { item in

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
                } // : LOOP
                
                // SHORT DESCRIPTION
                Text(library.wrappedFallacy.shortDescription)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 14, weight: .light, design: .rounded))
                
                // ALIASES
                Text("Some synonyms... \(library.wrappedFallacy.aliases[0]), \(library.wrappedFallacy.aliases[1]) ")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 14, weight: .light, design: .rounded))
                
                // LONG DESCRIPTION
                ForEach(library.wrappedFallacy.longDescription.components(separatedBy: "."), id: \.self) { item in

                    Text(item)
                        .font(.system(size: 12, weight: .light, design: .rounded))
                        .padding()
                        .multilineTextAlignment(.center)
                    }
                
                // ANSWERS
                ForEach(library.wrappedFallacy.wrappedAnswer.prefix(3), id: \.self) { item in

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
                    } //: LOOP
                
            } // : TABVIEW
                .padding()
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))

            // SKIP Button
            Button(action: {
                // Go to detail view
                withAnimation(.easeOut) {
                    library.selectedFallacy = library.wrappedFallacy
                    library.showingFallacy = true
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
