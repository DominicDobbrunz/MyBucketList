//
//  FireUser.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import Foundation

struct FireUser: Codable, Identifiable {
    let id: String
    let email: String
    let registeredOn: Date
    let name: String
    
}
