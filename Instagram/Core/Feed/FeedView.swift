//
//  FeedView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        
        
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 42)  {
                    FeedCellView()
                    FeedCellView()
                    FeedCellView()
                    FeedCellView()
                    FeedCellView()
                    FeedCellView()
                    FeedCellView()
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