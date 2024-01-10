//
//  FeedCellView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI
import Kingfisher

struct FeedCellView: View {
    @State var showComments = false
    @StateObject private var viewModel: FeedCellViewModel
    var post: Post {
        return viewModel.post
    }
    var didLike: Bool {
        return post.didLike ?? false
    }
    
    init(post: Post) {
        self._viewModel = StateObject(wrappedValue: FeedCellViewModel(post: post))
    }
    
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
                Button {
                    handleLikeClick()
                } label:  {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .foregroundStyle(didLike ? .pink : .black)
                }
                
                FeedCellActionView(imageName: "bubble.right", action: { showComments.toggle() })
                
                FeedCellActionView(imageName: "paperplane", action: {})
                
                Spacer()
            }
            .padding(.leading)
            .padding(.top, 4)
            
            VStack(alignment: .leading, spacing: 2) {
                // MARK: Likes label
                if post.likes > 0 {
                    Text("\(post.likes) likes")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
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
                Text(post.timestamp.toString())
                    .font(.footnote)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.horizontal)
            .padding(.top, 1)
        }
        .sheet(isPresented: $showComments) {
            CommentsView(post: post)
                .presentationDragIndicator(.visible)
        }
        
        
        
    }
    
    func handleLikeClick() {
        if didLike {
            Task { try await viewModel.unlike() }
        } else {
            Task { try await viewModel.like() }
        }
    }
}

#Preview {
    FeedCellView(post: .MOCK_POSTS[0])
}
