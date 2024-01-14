//
//  ImageUploader.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/14/24.
//

import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let filename = UUID().uuidString
        let reference = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
            let _ = try await reference.putDataAsync(imageData)
            let url = try await reference.downloadURL()
            return url.absoluteString
        } catch {
            print("Failed to upload image: \(error.localizedDescription)")
            return nil
        }
    }
}
