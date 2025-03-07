//
//  LikeViewModel 2.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 07.03.25.
//


import Firebase
import FirebaseAuth
import FirebaseFirestore
import Combine

class LikeViewModel: ObservableObject {
    @Published var likes: [LikeItem] = []
    private let db = Firestore.firestore()
    private var userId: String? {
        Auth.auth().currentUser?.uid
    }

    init() {
        fetchLikes()
    }

    func fetchLikes() {
        guard let userId = userId else { return }
        
        db.collection("likes")
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error fetching likes: \(error)")
                    return
                }
                self.likes = snapshot?.documents.compactMap { document in
                    try? document.data(as: LikeItem.self)
                } ?? []
            }
    }

    func addLike(_ like: LikeItem) {
        guard let userId = userId else { return }
        
        var newLike = like
        newLike.userId = userId
        
        do {
            try db.collection("likes").document(newLike.id.uuidString).setData(from: newLike)
        } catch {
            print("Error adding like: \(error)")
        }
    }

    func removeLike(_ like: LikeItem) {
        db.collection("likes").document(like.id.uuidString).delete()
    }
}
