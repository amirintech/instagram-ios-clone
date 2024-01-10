//
//  CommentsView.swift
//  Instagram
//
//  Created by Amir on 09/01/2024.
//

import SwiftUI

struct CommentsView: View {    
    @StateObject var viewModel: CommentViewModel
    
    init(post: Post) {
        self._viewModel = StateObject(wrappedValue: CommentViewModel(post: post))
    }
    
    var body: some View {
        
        
        VStack {
            Text("Comments")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.top)
            
            Divider()
            
            // MARK: Comments section
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(viewModel.comments) { comment in
                        CommentCellView(comment: comment)
                    }
                }
                .padding(.top)
            }
            
            Divider()
            
            // MARK: User input
            HStack(spacing: 12) {
                ProfileImageView(user: AuthService.shared.currentUser!, size: .extraSmall)
                
                ZStack(alignment: .trailing) {
                    TextField("Leave a comment", text: $viewModel.commentText, axis: .vertical)
                        .font(.footnote)
                        .padding(12)
                        .padding(.trailing, 42)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(.systemGray5), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                        }
                    
                    Button {
                        Task { try await viewModel.uploadComment() }
                    } label: {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)
                            .padding(.trailing)
                    }
                }
            }
            .padding(.horizontal)
        }
        
        
    }
}

#Preview {
    CommentsView(post: .MOCK_POSTS[0])
}
