//
//  FeedCellView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI
import Kingfisher

struct FeedCellView: View {
    let post: Post
    
    var body: some View {
        
        
        VStack {
            // MARK: Profile pic & username
            HStack {
                if let user = post.user {
                    ProfileImageView(user: post.user!, size: .extraSmall)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .padding(.leading)
            
            
            // MARK: Post img
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // MARK: Action Buttons
            HStack(spacing: 16) {
                FeedCellActionView(imageName: "heart", action: {})
                
                FeedCellActionView(imageName: "bubble.right", action: {})
                
                FeedCellActionView(imageName: "paperplane", action: {})
                
                Spacer()
            }
            .padding(.leading)
            .padding(.top, 4)
            
            VStack(alignment: .leading, spacing: 1) {
                // MARK: Likes label
                Text("\(post.likes) likes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                // MARK: Caption label
                if let username = post.user?.username {
                    HStack {
                        Text("\(username) ")
                            .fontWeight(.semibold) +
                        Text(post.caption)
                    }
                    .font(.footnote)
                    
                }
                
                // MARK: Timestamp
                Text("12h ago")
                    .font(.footnote)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.horizontal)
            .padding(.top, 1)
        }
        
        
    }
}

#Preview {
    FeedCellView(post: .MOCK_POSTS[0])
}
