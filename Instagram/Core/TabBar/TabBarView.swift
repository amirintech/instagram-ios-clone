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
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            Text("Upload")
                .tabItem {
                    Image(systemName: "plus.square")
                }
            
            Text("Notifications")
                .tabItem {
                    Image(systemName: "bell")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .tint(.black)
        
        
    }
}

#Preview {
    TabBarView()
}
