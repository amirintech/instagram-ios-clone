//
//  PrimaryButtonLabelModifier.swift
//  Instagram
//
//  Created by Amir on 06/01/2024.
//

import SwiftUI

struct PrimaryButtonLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
