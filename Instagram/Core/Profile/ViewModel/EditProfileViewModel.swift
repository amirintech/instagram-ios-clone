//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by Amir on 07/01/2024.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var image: Image?
    @Published var fullName = ""
    @Published var bio = ""
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        
        if let fullName = user.fullName {
            self.fullName = fullName
        }
        
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.image = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        var data = [String: Any]()
        
        if let uiImage = self.uiImage {
            let url = try await StorageService.uploadFile(type: uiImage)
            data["profileImageUrl"] = url
        }
        
        if !fullName.isEmpty && user.fullName != fullName.trimmingCharacters(in: .whitespacesAndNewlines) {
            data["fullName"] = fullName
        }
        
        if !bio.isEmpty && user.bio != bio.trimmingCharacters(in: .whitespacesAndNewlines) {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            let userDocumentRef = Firestore.firestore().collection("users").document(user.id)
            try await userDocumentRef.updateData(data)
            
            // delete old profile image if any
            if let oldProfileImageUrl = user.profileImageUrl {
                try? await StorageService.deleteFile(at: oldProfileImageUrl)
            }
        }
    }
    
}
