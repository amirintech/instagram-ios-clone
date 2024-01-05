//
//  TabView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        
        
        TabView {
            Text("Feed")
            
            Text("Search")
            
            Text("Upload")
            
            Text("Notifications")
            
            Text("Profile")
        }
        
        
    }
}

#Preview {
    TabBarView()
}
