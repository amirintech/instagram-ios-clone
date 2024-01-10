//
//  FirebaseConstants.swift
//  Instagram
//
//  Created by Amir on 10/01/2024.
//

import Firebase

struct FirestoreConstants {
    static var root = Firestore.firestore()
    static var usersCollection = root.collection("users")
    static var postsCollection = root.collection("posts")
}
