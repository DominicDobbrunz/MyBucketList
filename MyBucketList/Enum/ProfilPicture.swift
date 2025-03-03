//
//  ProfilPicture.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 03.03.25.
//
import Foundation
import SwiftUI

enum ProfilPicture: String, Identifiable, Codable {
    case sun = "Sonne"
    case adventure = "Abenteuer"
    case city = "Stadt"
    case landscape = "Landschaft"
    case snow = "Schnee"
    
    var id: String {self.rawValue}
}
