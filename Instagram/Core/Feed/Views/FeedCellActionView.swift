//
//  FeedCellActionView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct FeedCellActionView: View {
    let imageName: String
    let action: () -> Void
    
    var body: some View {
        
        
        Button {
            action()
        } label:  {
            Image(systemName: imageName)
                .foregroundStyle(.black)
        }
        
        
    }
}

#Preview {
    FeedCellActionView(imageName: "heart", action: {})
}
