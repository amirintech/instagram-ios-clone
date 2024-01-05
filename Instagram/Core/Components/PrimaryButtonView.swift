//
//  PrimaryButtonView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct PrimaryButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        
        
        Button {
            action()
        } label: {
            Text(title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        
        
    }
}

#Preview {
    PrimaryButtonView(title: "Login", action: {})
}
