//
//  BucketItem.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 17.02.25.
//

import Foundation
import SwiftUI
import Firebase

struct BucketListItem: Identifiable, Codable, Hashable {
    var id = UUID()
    var title: String
    var country: String
    var location: String
    var companion: Companion
    var picture: TilePicture
    var completed: Bool = false
    
    init(id: UUID = UUID(), title: String, country: String, location: String, companion: Companion, picture: TilePicture, completed: Bool = false) {
            self.id = id
            self.title = title
            self.country = country
            self.location = location
            self.companion = companion
            self.picture = picture
            self.completed = completed
        }

    // Hashable-Protokoll manuell implementieren (optional, aber empfohlen)
    static func == (lhs: BucketListItem, rhs: BucketListItem) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
