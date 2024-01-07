//
//  PasswordView.swift
//  Instagram
//
//  Created by Amir on 06/01/2024.
//

import SwiftUI

struct PasswordView: View {
    @EnvironmentObject private var viewModel: RegisterationViewModel
    
    var body: some View {
        
        
        RegisterationStepView(title: "Create password", description: "Password must be at least 8 chahcters long.", textFieldPlaceholder: "Enter a password", actionLabel: "Next", nextView: CompleteRegisterationView(), isSecuredField: true, textFieldBinding: $viewModel.password)
        
        
    }
}

#Preview {
    PasswordView()
}
