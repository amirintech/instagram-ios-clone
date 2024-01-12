//
//  UserList.swift
//  Instagram
//
//  Created by Amir on 12/01/2024.
//

import Foundation

enum UserList: Hashable {
    case following(uid: String)
    case followers(uid: String)
    case likes(postId: String)
    case explore
    
    var title: String {
        switch self {
        case .following: return "Following"
        case .followers: return "Followers"
        case .likes: return "Likes"
        case .explore: return "Explore"
        }
    }
}
