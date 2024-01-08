//
//  UploadPostView.swift
//  Instagram
//
//  Created by Amir on 06/01/2024.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var isPickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var selectedViewIndex: TabBarView.Views
    
    var body: some View {

        
        VStack {
            
            
            // MARK: Action toolbar
            HStack {
                Button {
                    cleanFieldsAndRedirect()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    Task { 
                        try await viewModel.uploadPost()
                        cleanFieldsAndRedirect()
                    }
                    
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            
            
            // MARK: Post image & caption
            HStack(alignment: viewModel.caption.isEmpty ? .center : .top, spacing: 8) {
                if let image = viewModel.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                
                TextField("Enter your caption...", text: $viewModel.caption, axis: .vertical)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .onAppear {
            isPickerPresented = true
        }
        .photosPicker(isPresented: $isPickerPresented, selection: $viewModel.selectedImage)
        .onChange(of: isPickerPresented) { oldValue, newValue in
            if newValue == false && viewModel.selectedImage == nil {
                cleanFieldsAndRedirect()
            }
        }
        
        
    }
    
    func cleanFieldsAndRedirect() {
        viewModel.caption = ""
        viewModel.image = nil
        viewModel.selectedImage = nil
        selectedViewIndex = .Feed
    }
}

#Preview {
    UploadPostView(selectedViewIndex: .constant(.UploadPost))
}
