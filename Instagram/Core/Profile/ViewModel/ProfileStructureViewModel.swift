//
//  ProfileStructureViewModel.swift
//  Instagram
//
//  Created by Amir on 08/01/2024.
//

import Foundation

class ProfileStructureViewModel: ObservableObject {
    private let user: User
    
    @Published var posts = [Post]()
    
    init(user: User) {
        self.user = user
        
        Task { try await loadPosts() }
    }
    
    @MainActor
    func loadPosts() async throws {
        self.posts = try await PostService.fetchUserPosts(uid: user.id)
        for i in 0 ..< self.posts.count {
            posts[i].user = user
        }
    }
}
