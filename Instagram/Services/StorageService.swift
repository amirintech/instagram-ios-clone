//
//  ImageUploaderService.swift
//  Instagram
//
//  Created by Amir on 07/01/2024.
//

import Foundation
import Firebase
import FirebaseStorage

enum UploadDestination {
    case profileImage
    case postImage
    
    var path: String {
        switch self {
        case .profileImage: "profile_images"
        case .postImage: "post_images"
        }
    }
}

struct StorageService {
    static func uploadFile(type: UIImage, destination: UploadDestination) async throws -> String? {
        guard let data = type.jpegData(compressionQuality: 0.5) else { return nil }
        let path = "/\(destination.path)/\(NSUUID().uuidString)"
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
