//
//  PostUploader.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/16/24.
//

import Foundation
import Firebase
import FirebaseFirestore

struct PostUploader {
    private let postDB = Firestore.firestore().collection("posts")
    
    func upload(post: Post) async {
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        try? await postDB.document(post.id).setData(encodedPost)
    }
}
