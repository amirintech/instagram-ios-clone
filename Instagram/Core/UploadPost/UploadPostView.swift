//
//  UploadPostView.swift
//  Instagram
//
//  Created by Amir on 06/01/2024.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var isPickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var selectedViewIndex: TabBarView.Views
    
    var body: some View {
        
        
        VStack {
            // MARK: Action toolbar
            HStack {
                Button {
                    caption = ""
                    viewModel.image = nil
                    viewModel.selectedImage = nil
                    selectedViewIndex = .Feed
                    
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    print("Upload")
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            
            
            // MARK: Post image & caption
            HStack(alignment: caption.isEmpty ? .center : .top, spacing: 8) {
                if let image = viewModel.image {
                    image
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                
                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .onAppear {
            isPickerPresented.toggle()
        }
        .photosPicker(isPresented: $isPickerPresented, selection: $viewModel.selectedImage)
        
        
    }
}

#Preview {
    UploadPostView(selectedViewIndex: .constant(.UploadPost))
}
