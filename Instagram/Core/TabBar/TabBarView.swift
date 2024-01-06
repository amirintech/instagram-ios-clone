//
//  TabView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct TabBarView: View {
    enum Views: Int {
        case Feed = 0
        case Explore = 1
        case UploadPost = 2
        case Notification = 3
        case Profile = 4
    }
    
    @State var selectedViewIndex = Views.Feed
    
    var body: some View {
        
        
        TabView(selection: $selectedViewIndex) {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(Views.Feed)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(Views.Explore)
            
            UploadPostView(selectedViewIndex: $selectedViewIndex)
                .tabItem {
                    Image(systemName: "plus.square")
                }
                .tag(Views.UploadPost)
            
            Text("Notifications")
                .tabItem {
                    Image(systemName: "bell")
                }
                .tag(Views.Notification)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(Views.Profile)
        }
        .tint(.black)
        
        
    }
}

#Preview {
    TabBarView()
}
