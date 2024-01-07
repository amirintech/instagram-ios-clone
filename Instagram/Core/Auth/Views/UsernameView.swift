//
//  UsernameView.swift
//  Instagram
//
//  Created by Amir on 06/01/2024.
//

import SwiftUI

struct UsernameView: View {
    @EnvironmentObject private var viewModel: RegisterationViewModel
    
    var body: some View {
        
        
        RegisterationStepView(title: "Create username", description: "Your username will be used to identify your account.", textFieldPlaceholder: "Enter a username", actionLabel: "Next", nextView: PasswordView(), textFieldBinding: $viewModel.username)
        
        
    }
}

#Preview {
    UsernameView()
}
