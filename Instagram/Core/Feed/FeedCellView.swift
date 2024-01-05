//
//  FeedCellView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct FeedCellView: View {
    var body: some View {
        
        
        VStack {
            // MARK: Profile pic & username
            HStack {
                Image("ned-stark")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 42, height: 42)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Text("nedstark")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.leading)
            
            
            // MARK: Post img
            Image("post-img")
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // MARK: Action Buttons
            HStack(spacing: 16) {
                FeedCellActionView(imageName: "heart", action: {})
                
                FeedCellActionView(imageName: "bubble.right", action: {})
                
                FeedCellActionView(imageName: "paperplane", action: {})
                
                Spacer()
            }
            .padding(.leading)
            .padding(.top, 4)
            
            VStack(alignment: .leading, spacing: 1) {
                // MARK: Likes label
                Text("291 likes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                // MARK: Caption label
                HStack {
                    Text("nedstark ")
                        .fontWeight(.semibold) +
                    Text("Some awesome caption written by warden of the north goes here.")
                }
                .font(.footnote)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                // MARK: Timestamp
                Text("12h ago")
                    .font(.footnote)
            }
            .padding(.horizontal)
            .padding(.top, 1)
        }
        
        
    }
}

#Preview {
    FeedCellView()
}
