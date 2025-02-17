
//
//  Firebase.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import FirebaseAuth
import FirebaseFirestore

final class FirebaseManager {
    
    static let shared = FirebaseManager()
    private init() {}
    
    let auth = Auth.auth()
    let database = Firestore.firestore()
}
