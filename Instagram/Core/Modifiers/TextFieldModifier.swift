//
//  TextFieldModifier.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal)
    }
}
