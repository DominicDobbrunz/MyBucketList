//
//  FireMyBucketList.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import Foundation
import FirebaseFirestore

struct FireMyBucketList: Codable, Identifiable {
    @DocumentID var id: String?
    let title: String
    let code: String
    let userId: String
}
