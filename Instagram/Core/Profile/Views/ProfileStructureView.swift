//
//  ProfileStructureView.swift
//  Instagram
//
//  Created by Amir on 06/01/2024.
//

import SwiftUI

struct ProfileStructureView: View {
    let user: User
    var posts: [Post] {
        return Post.MOCK_POSTS.filter { $0.userId == user.id }
    }
    
    private let imageDimension = UIScreen.main.bounds.width / 3 - 1
    private let gridCols: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    @State private var showEditProfileView = false
    
    
    var body: some View {
        
        
        ScrollView {
            VStack(spacing: 24) {
                // MARK: Header
                VStack(spacing: 12) {
                    // MARK: Profile pic & stats
                    HStack {
                        ProfileImageView(user: user, size: .large)
                        
                        Spacer()
                        
                        ProfileStatView(title: "Posts", value: 6)
                        ProfileStatView(title: "Followers", value: 60)
                        ProfileStatView(title: "Following", value: 16)
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
                        Button {
                            showEditProfileView = true
                        } label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(lineWidth: 1)
                                        .foregroundStyle(.black)
                                }
                        }
                    } else {
                        Button {
                            
                        } label: {
                            Text("Follow")
                                .modifier(PrimaryButtonLabelModifier(padding: (vertical: 8, horizontal: 0)))
                        }
                    }
                }.padding(.horizontal)
                
                // MARK: Posts grid
                LazyVGrid(columns: gridCols, spacing: 1) {
                    ForEach(posts) { post in
                        Image(post.imageUrl)
                            .resizable()
                            .frame(width: imageDimension, height: imageDimension)
                            .scaledToFill()
                    }
                }
                
                Spacer()
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            print(user)
        }
        .fullScreenCover(isPresented: $showEditProfileView) {
            EditProfileView(user: user)
        }
        
        
    }
}

#Preview {
    ProfileStructureView(user: .MOCK_USERS[0])
}
