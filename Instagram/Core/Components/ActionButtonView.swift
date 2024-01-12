//
//  ActionButton.swift
//  Instagram
//
//  Created by Amir on 11/01/2024.
//

import SwiftUI

struct ActionButtonView: View {
    enum Variant {
        case primary
        case secondary
    }
    
    var variant = Variant.primary
    
    let action: () -> Void
    let text: String
    
    var body: some View {
        
        
        if variant == .secondary {
            Button(action: action) {
                Text(text)
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
                    .frame(height: 40)
            }
        } else if variant == .primary {
            Button(action: action ) {
                Text(text)
                    .modifier(PrimaryButtonLabelModifier(padding: (vertical: 8, horizontal: 0)))
                    .frame(height: 40)
            }
        }
        
        
    }
}

#Preview {
    ActionButtonView(action: {}, text: "Click me!")
}
