//
//  Bucket.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 18.02.25.
//

import Foundation
import Firebase
import SwiftUI

struct Bucket: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var completed: Bool = false
}

