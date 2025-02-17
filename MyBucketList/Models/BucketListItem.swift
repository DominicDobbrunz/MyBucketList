//
//  BucketItem.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 17.02.25.
//

import Foundation
import SwiftUI
import Firebase

struct BucketListItem: Identifiable {
    let id = UUID()
    var title: String
    var country: String
    var companion: Companion
}
