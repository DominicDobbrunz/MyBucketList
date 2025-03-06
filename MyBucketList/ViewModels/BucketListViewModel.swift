//
//  BucketListViewModel.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 26.02.25.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore
import Combine

class BucketListViewModel: ObservableObject {
    @Published var buckets: [BucketListItem] = []
    private let db = Firestore.firestore()
    private var userId: String? {
        Auth.auth().currentUser?.uid
    }

    init() {
        fetchBuckets()
    }

    func fetchBuckets() {
        guard let userId = userId else {
            print("User is not logged in.")
            return
        }
        
        db.collection("buckets")
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error fetching buckets: \(error)")
                    return
                }
                self.buckets = snapshot?.documents.compactMap { document in
                    try? document.data(as: BucketListItem.self)
                } ?? []
            }
    }

    func addBucket(_ bucket: BucketListItem) {
        guard let userId = userId else {
            print("User is not logged in.")
            return
        }
        
        var newBucket = bucket
        newBucket.userId = userId
        do {
            try db.collection("buckets").document(newBucket.id.uuidString).setData(from: newBucket)
        } catch {
            print("Error adding bucket: \(error)")
        }
    }

    func markAsCompleted(index: Int) {
        guard let userId = userId else {
            print("User is not logged in.")
            return
        }
        
        let bucket = buckets[index]
        db.collection("buckets").document(bucket.id.uuidString).updateData(["completed": true])
    }
}

