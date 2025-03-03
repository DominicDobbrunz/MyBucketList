//
//  FlagRespone.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 28.02.25.
//

import Foundation

struct FlagResponse: Codable {
    
    let continentCode : String
    let continetName: String
    let countryCode: String
    let countryName: String
    let regionCode: String
    let regionName: String
    let city: String
    let zip: Int
    let countryFlag: String
    let CountryFlagEmoji: String
    let countryFlagEmojiUnicode: String
    let callingCode: Int
    
    let latitude: Double
    let longitude: Double
}
