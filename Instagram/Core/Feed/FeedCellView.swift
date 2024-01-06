//
//  FeedCellView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct FeedCellView: View {
    let post: Post
    
    var body: some View {
        
        
        VStack {
            // MARK: Profile pic & username
            HStack {
                if let profileImage = post.user?.profileImageUrl {
                    Image(profileImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 42, height: 42)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                
                if let username = post.user?.username {
                    Text(username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .padding(.leading)
            
            
            // MARK: Post img
            Image(post.imageUrl)
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
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                }
                
                // MARK: Timestamp
                Text("12h ago")
                    .font(.footnote)
            }
            .padding(.horizontal)
            .padding(.top, 1)
        }
        
        
    }
}

#Preview {
    FeedCellView(post: .MOCK_POSTS[0])
}
