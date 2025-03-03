//
//  LikeItem.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 25.02.25.
//


import Foundation

struct LikeItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var imageName: String
}
