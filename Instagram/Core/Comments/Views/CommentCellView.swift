//
//  CommentCellView.swift
//  Instagram
//
//  Created by Amir on 09/01/2024.
//

import SwiftUI

struct CommentCellView: View {
    let comment: Comment
    var user: User {
        return comment.user!
    }
    
    var body: some View {
        
        
        HStack(alignment: .top) {
            ProfileImageView(user: user, size: .extraSmall)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Text(user.username)
                        .fontWeight(.semibold)
                    
                    Text(comment.timestamp.toString())
                        .foregroundStyle(.gray)
                }
                
                Text(comment.commentText)
            }
            
            Spacer()
        }
        .font(.caption)
        .padding(.horizontal)
        
        
    }
}

#Preview {
    CommentCellView(comment: .MOCK_COMMENTS[0])
}
