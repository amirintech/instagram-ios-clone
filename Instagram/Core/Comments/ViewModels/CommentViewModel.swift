//
//  CommentViewModel.swift
//  Instagram
//
//  Created by Amir on 10/01/2024.
//

import Firebase

@MainActor
class CommentViewModel: ObservableObject {
    @Published var comments = [Comment]()
    @Published var commentText = ""
    
    private let post: Post
    
    init(post: Post) {
        self.post = post
        
        Task { try await loadComments() }
    }
    
    func uploadComment() async throws {
        updateUI()
        
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let comment = Comment(
            commentOwnerId: userId,
            postOwnerId: post.userId,
            postId: post.id,
            commentText: commentText,
            timestamp: Timestamp(),
            user: AuthService.shared.currentUser!
        )
        
        try await CommentService.upload(comment: comment)
        
        cleanUp()
    }
    
    private func loadComments() async throws {
        self.comments = try await CommentService.fetchComments(for: post.id)
    }
    
    private func cleanUp() {
        commentText = ""
    }
    
    private func updateUI() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let comment = Comment(
            id: NSUUID().uuidString,
            commentOwnerId: userId,
            postOwnerId: post.userId,
            postId: post.id,
            commentText: commentText,
            timestamp: Timestamp(),
            user: AuthService.shared.currentUser!
        )
        
        // optimisitcally update ui
        comments.insert(comment, at: 0)
    }
}
