//
//  Companio.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 17.02.25.
//
import Foundation
import SwiftUI


import SwiftUI

enum Companion: String, Codable, CaseIterable, Identifiable {
    case alone = "Alleine"
    case partner = "Freund/Freundin"
    case family = "Familie"
    case friends = "Freunde"
    
    var id: String { self.rawValue }
}
