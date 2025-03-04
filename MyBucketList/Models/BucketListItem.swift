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
    var completed: Bool = false

    // Hashable-Protokoll manuell implementieren (optional, aber empfohlen)
    static func == (lhs: BucketListItem, rhs: BucketListItem) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
