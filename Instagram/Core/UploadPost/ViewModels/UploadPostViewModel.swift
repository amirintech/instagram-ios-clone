//
//  UploadPostViewModel.swift
//  Instagram
//
//  Created by Amir on 06/01/2024.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var image: Image?
    @Published var caption = ""
    
    private var uiImage: UIImage?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.image = Image(uiImage: uiImage)
    }
    
    func uploadPost() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = self.uiImage else { return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await StorageService.uploadFile(type: uiImage, destination: .postImage) else { return }
        
        let post = Post(id: postRef.documentID, userId: uid, caption: self.caption, imageUrl: imageUrl, timestamp: Timestamp(), likes: 0)
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        
        try await postRef.setData(encodedPost)
    }
}
