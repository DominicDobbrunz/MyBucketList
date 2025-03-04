//
//  BucketListViewModel.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 26.02.25.
//


import SwiftUI
import Firebase

class BucketListViewModel: ObservableObject {
    @Published var buckets: [BucketListItem] = [] // Direkt mit leerem Array initialisieren
    private let userDefaultsKey = "savedBuckets"
    var isFirstOpen = true

    init() {
        self.buckets = loadFromUserDefaults()
        //self.buckets = loadFromUserDefaults()
    }

    
    
    func addBucket(_ bucket: BucketListItem) {
        buckets.append(bucket)
        saveToUserDefaults()
    }

    func markAsCompleted(index: Int) {
        buckets[index].completed = true
        saveToUserDefaults()
    }

    func saveToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(buckets) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }

    func loadFromUserDefaults() -> [BucketListItem] {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decoded = try? JSONDecoder().decode([BucketListItem].self, from: savedData) {
            return decoded
        }
        return [] // Falls kein gespeicherter Wert existiert, geben wir ein leeres Array zurück
    }
}


