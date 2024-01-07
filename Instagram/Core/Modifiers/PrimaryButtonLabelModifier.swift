//
//  PrimaryButtonLabelModifier.swift
//  Instagram
//
//  Created by Amir on 06/01/2024.
//

import SwiftUI

struct PrimaryButtonLabelModifier: ViewModifier {
    var padding: (vertical: CGFloat, horizontal: CGFloat)
    
    init() {
        self.padding = (vertical: 12, horizontal: 0)
    }
    
    init(padding: (vertical: CGFloat, horizontal: CGFloat)) {
        self.padding = padding
    }
    
    func body(content: Content) -> some View {
        content
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, self.padding.vertical)
            .padding(.horizontal, self.padding.horizontal)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}
