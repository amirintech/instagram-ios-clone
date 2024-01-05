//
//  ProfileView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct ProfileView: View {
    private let gridCols: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    
    var body: some View {
        
        
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // MARK: Header
                    VStack {
                        // MARK: Profile pic & stats
                        HStack {
                            Image("ned-stark")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            
                            Spacer()
                            
                            ProfileStatView(title: "Posts", value: 6)
                            ProfileStatView(title: "Followers", value: 60)
                            ProfileStatView(title: "Following", value: 16)
                        }
                        .frame(maxWidth: .infinity)
                        
                        
                        // MARK: Name & bio
                        VStack(alignment: .leading) {
                            Text("Eddard Stark")
                                .fontWeight(.semibold)
                            
                            Text("When the snows fall and the white winds blow, the lone wolf dies but the pack survives.")
                        }
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // MARK: Action button
                        Button {
                            
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
                    }
                    .padding(.horizontal)
                    
                    // MARK: Posts grid
                    LazyVGrid(columns: gridCols, spacing: 1) {
                        Image("post-img")
                            .resizable()
                            .scaledToFill()
                        
                        Image("post-img")
                            .resizable()
                            .scaledToFill()
                        
                        Image("post-img")
                            .resizable()
                            .scaledToFill()
                        
                        Image("post-img")
                            .resizable()
                            .scaledToFill()
                        
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundStyle(.black)
                }
            }
        }
        
        
    }
}

#Preview {
    ProfileView()
}
