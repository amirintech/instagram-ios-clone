//
//  SearchView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct SearchView: View {
    @State var searchQuery = ""
    
    var body: some View {
        
        
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    SearchItemView()
                    SearchItemView()
                    SearchItemView()
                    SearchItemView()
                }
                .searchable(text: $searchQuery)
                .padding(.top, 8)
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
        
    }
}

#Preview {
    SearchView()
}
