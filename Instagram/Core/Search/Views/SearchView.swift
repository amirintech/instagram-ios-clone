//
//  SearchView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct SearchView: View {
    @State var searchQuery = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        
        
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            SearchItemView(user: user)
                        }
                    }
                }
                .searchable(text: $searchQuery)
                .padding(.top, 8)
                .foregroundStyle(.black)
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: User.self) { user in
                ProfileStructureView(user: user)
            }
        }
        
        
    }
}

#Preview {
    SearchView()
}
