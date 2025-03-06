//
//  TileViewModel.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 03.03.25.
//
import Firebase
import FirebaseAuth
import FirebaseFirestore
import Combine

class TileViewModel: ObservableObject {
    @Published var tiles: [BucketListItem] = []
    private let db = Firestore.firestore()
    private var userId: String? {
        Auth.auth().currentUser?.uid
    }

    init() {
        fetchTiles()
    }

    func fetchTiles() {
        guard let userId = userId else { return }
        db.collection("tiles")
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error fetching tiles: \(error)")
                    return
                }
                self.tiles = snapshot?.documents.compactMap { document in
                    try? document.data(as: BucketListItem.self)
                } ?? []
            }
    }

    func addTile(_ tile: BucketListItem) {
        guard let userId = userId else { return }
        var newTile = tile
        newTile.userId = userId
        do {
            try db.collection("tiles").document(newTile.id.uuidString).setData(from: newTile)
        } catch {
            print("Error adding tile: \(error)")
        }
    }

    func removeTile(_ tile: BucketListItem) {
        db.collection("tiles").document(tile.id.uuidString).delete()
    }
}
