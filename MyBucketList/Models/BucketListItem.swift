//
//  BucketItem.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 17.02.25.
//

import Foundation



struct BucketListItem: Identifiable, Codable, Hashable {
    var id = UUID()
    var userId: String
    var title: String
    var country: String
    var location: String
    var companion: Companion
    var picture: TilePicture
    var completed: Bool = false
    
    static func == (lhs: BucketListItem, rhs: BucketListItem) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
