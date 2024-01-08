//
//  FeedView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        
        
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 42)  {
                    ForEach(viewModel.posts) { post in
                        FeedCellView(post: post)
                    }
                }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Toolbar
                ToolbarItem(placement: .topBarLeading) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
        }
        
        
    }
}

#Preview {
    FeedView()
}
