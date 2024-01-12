//
//  ProfileStructureViewModel.swift
//  Instagram
//
//  Created by Amir on 08/01/2024.
//

import Foundation

@MainActor
class ProfileStructureViewModel: ObservableObject {
    @Published var user: User
    @Published var posts = [Post]()
    
    init(user: User) {
        self.user = user
    }
    
    func loadPosts() {
        Task {
            self.posts = try await PostService.fetchUserPosts(uid: user.id)
            for i in 0 ..< self.posts.count {
                posts[i].user = user
            }
        }
    }
    
    func fetchStats() {
        Task {
            user.stats = try await UserService.fetchStats(uid: user.id)
        }
    }
}


// MARK: Following
extension ProfileStructureViewModel {
    func follow() {
        Task {
            do {
                user.isFollowed = true
                try await ConnectionService.follow(user: user)
            } catch {
                user.isFollowed = false
                print("following user failed: \(error.localizedDescription)")
            }
        }
    }
    
    func unfollow() {
        Task {
            do {
                user.isFollowed = false
                try await ConnectionService.unfollow(user: user)
            } catch {
                user.isFollowed = true
                print("unfollowing user failed: \(error.localizedDescription)")
            }
        }
    }
    
    func initFollowingState() {
        Task {
            user.isFollowed = try await ConnectionService.isFollowing(user: user)
        }
    }
}
