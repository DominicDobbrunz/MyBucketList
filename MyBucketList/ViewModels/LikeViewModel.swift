//
//  LikeViewModel.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 03.03.25.
//
import SwiftUI
import Firebase

class LikeViewModel: ObservableObject {
    @Published var likes: [LikeItem] = [] {
        didSet {
            saveToUserDefaults()
        }
    }
    
    private let saveKey = "savedLikes"

    init() {
        loadFromUserDefaults()
    }
    
    // ✅ Speichern in UserDefaults
    private func saveToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(likes) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }

    // ✅ Laden aus UserDefaults
    private func loadFromUserDefaults() {
        if let savedData = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([LikeItem].self, from: savedData) {
            self.likes = decoded
        }
    }
}
