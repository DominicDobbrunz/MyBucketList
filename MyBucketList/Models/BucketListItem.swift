//
//  BucketItem.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 17.02.25.
//

import Foundation
import SwiftUI
import Firebase

struct BucketListItem: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var country: String
    var location: String
    var companion: Companion

    // Hashable-Protokoll manuell implementieren (optional, aber empfohlen)
    static func == (lhs: BucketListItem, rhs: BucketListItem) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
