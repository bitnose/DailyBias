//
//  SettingsView.swift
//  DailyFallacy
//
//  Created by Sötnos on 4.4.2021.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - PROPERTIES
    

    
    // MARK: - BODY
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    
                } //: VSTACK
                .navigationBarTitle(Text("Settings"), displayMode: .inline)
                .padding()
            } //: SCROLL
        } //: NAVIGATION
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
