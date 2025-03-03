//
//  TileViewModel.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 03.03.25.
//
import SwiftUI
import Firebase

class TileViewModel: ObservableObject {
    @Published var tiles: [BucketListItem] = [] {
        didSet {
            saveToUserDefaults()
        }
    }
    
    private let saveKey = "savedTiles"
    
    init() {
        loadFromUserDefaults()
    }
    
    // ✅ Speichert die Tiles in UserDefaults
    private func saveToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(tiles) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    // ✅ Lädt die gespeicherten Tiles
    private func loadFromUserDefaults() {
        if let savedData = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([BucketListItem].self, from: savedData) {
            self.tiles = decoded
        }
    }
}
