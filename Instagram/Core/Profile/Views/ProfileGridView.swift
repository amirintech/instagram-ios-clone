//
//  ProfileGridView.swift
//  Instagram
//
//  Created by Amir on 11/01/2024.
//

import SwiftUI
import Kingfisher

struct ProfileGridView: View {
    private let imageDimension = UIScreen.main.bounds.width / 3 - 1
    private let gridCols: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    let posts: [Post]
    
    var body: some View {
        
        
        LazyVGrid(columns: gridCols, spacing: 1) {
            ForEach(posts) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
            }
        }
        
        
    }
}

#Preview {
    ProfileGridView(posts: [])
}
