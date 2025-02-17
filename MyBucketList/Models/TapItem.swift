//
//  TapItem.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 12.02.25.
//
import Foundation
import SwiftUI

struct TapItem: Identifiable {
    var id = UUID()
    var icon: String
    var tap: Tap
}
var tapItems = [
    TapItem(icon: "bag", tap: .bucket),
    TapItem(icon: "heart.fill", tap: .erinnerrung),
    TapItem(icon: "map", tap: .karte),
    TapItem(icon: "person.circle", tap: .profil)
]

