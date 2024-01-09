//
//  FeedCellViewModel.swift
//  Instagram
//
//  Created by Amir on 08/01/2024.
//

import Foundation

@MainActor
class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
        
        Task { try await setDidLike() }
    }
    
    func like() async throws {
        do {
            post.didLike = true
            post.likes += 1
            
            try await PostService.like(post: self.post)
        } catch {
            rollback()
        }
    }
    
    func unlike() async throws {
        do {
            post.didLike = false
            post.likes -= 1
            
            try await PostService.unlike(post: self.post)
        } catch {
            rollback()
        }
    }
    
    private func rollback() {
        self.post.likes += self.post.didLike ?? false ? -1 : 1
        self.post.didLike?.toggle()
    }
    
    private func setDidLike() async throws {
        self.post.didLike = try await PostService.didUserLike(post: self.post)
    }
}
