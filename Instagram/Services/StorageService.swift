//
//  ImageUploaderService.swift
//  Instagram
//
//  Created by Amir on 07/01/2024.
//

import Foundation
import Firebase
import FirebaseStorage

struct StorageService {
    static func uploadFile(type: UIImage) async throws -> String? {
        guard let data = type.jpegData(compressionQuality: 0.5) else { return nil }
        let path = "/profile_images/\(AuthService.shared.currentUser!.id)/\(NSUUID().uuidString)"
        let ref = Storage.storage().reference(withPath: path)
        
        do {
            let _ = try await ref.putDataAsync(data)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("uploadFile ERROR: \(error)")
            return nil
        }
    }
    
    static func deleteFile(at path: String) async throws {
        let storageRef = Storage.storage().reference(withPath: path)
        try await storageRef.delete()
    }
}
