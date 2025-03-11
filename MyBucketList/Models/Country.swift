//
//  Country.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 11.03.25.
//

import Foundation

struct Country: Identifiable {
    let id = UUID()
    let name: String
    let flag: String
    let capital: String
    var isChecked: Bool = false
}
