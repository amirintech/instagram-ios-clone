//
//  ProfileStructureView.swift
//  Instagram
//
//  Created by Amir on 06/01/2024.
//

import SwiftUI
import Kingfisher

struct ProfileStructureView: View {
    @State private var showEditProfileView = false
    @StateObject private var viewModel: ProfileStructureViewModel
    
    private var user: User {
        return viewModel.user
    }
    private var isFollowed: Bool {
        return viewModel.user.isFollowed ?? false
    }
    private var stats: UserStats {
        return user.stats ?? UserStats(followingCount: 0, followersCount: 0, postsCount: 0)
    }
    
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: ProfileStructureViewModel(user: user))
    }
    
    var body: some View {
        
        
        ScrollView {
            VStack(spacing: 24) {
                // MARK: Header
                VStack(spacing: 12) {
                    // MARK: Profile pic & stats
                    HStack {
                        ProfileImageView(user: user, size: .large)
                        
                        Spacer()
                        
                        ProfileStatView(title: "Posts", value: stats.postsCount)
                        
                        NavigationLink(value: UserList.followers(uid: user.id)) {
                            ProfileStatView(title: "Followers", value: stats.followersCount)
                        }
                        
                        NavigationLink(value: UserList.following(uid: user.id)) {
                            ProfileStatView(title: "Following", value: stats.followingCount)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    // MARK: Name & bio
                    VStack(alignment: .leading) {
                        if let fullName = user.fullName {
                            Text(fullName)
                                .fontWeight(.semibold)
                        }
                        
                        if let bio = user.bio {
                            Text(bio)
                        }
                    }
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // MARK: Action button
                    if user.isCurrentUser {
                        ActionButtonView(variant: .secondary, action: { showEditProfileView = true }, text: "Edit Profile")
                    } else if isFollowed {
                        ActionButtonView(variant: .secondary, action: { viewModel.unfollow() }, text: "Unfollow")
                    } else {
                        ActionButtonView(action: { viewModel.follow() }, text: "Follow")
                    }
                }.padding(.horizontal)
                
                // MARK: Posts grid
                ProfileGridView(posts: viewModel.posts)
                
                Spacer()
            }
            .navigationDestination(for: UserList.self) { list in
                Text(list.title)
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $showEditProfileView) {
            EditProfileView(user: user)
        }
        .onAppear {
            viewModel.loadPosts()
            
            if user.isFollowed == nil {
                viewModel.initFollowingState()
            }
            
            if user.stats == nil {
                viewModel.fetchStats()
            }
        }
        
        
    }
}

#Preview {
    ProfileStructureView(user: .MOCK_USERS[0])
}
