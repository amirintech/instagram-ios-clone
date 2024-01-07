//
//  EditProfileView.swift
//  Instagram
//
//  Created by Amir on 07/01/2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: EditProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        
        
        VStack {
            // MARK: Toolbar
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        Task { 
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.horizontal)
                
                Divider()
            }
            
            // MARK: Edit profile image
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let image = viewModel.image {
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .scaledToFill()
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    } else {
                        Image("default-profile-img")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .scaledToFill()
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                    
                    
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.vertical)
            
            Divider()
            
            
            // MARK: Edit profile info
            EditableRowView(title: "Full name:", placeholder: "Amir", value: $viewModel.fullName)
            
            EditableRowView(title: "Bio:", placeholder: "Enter your bio", value: $viewModel.bio)
            
            Spacer()
        }
        
        
    }
}

struct EditableRowView: View {
    let title: String
    let placeholder: String
    
    @Binding var value: String
    
    var body: some View {
        
        
        HStack {
            Text(title)
                .padding(.leading)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $value, axis: .vertical)
                
                Divider()
            }
        }
        .font(.subheadline)
        
        
    }
}

#Preview {
    EditProfileView(user: .MOCK_USERS[0])
}
