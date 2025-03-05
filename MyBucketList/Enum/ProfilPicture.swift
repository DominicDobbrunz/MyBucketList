//
//  ProfilPicture.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 04.03.25.
//
import Foundation
import SwiftUI


enum Occupation: String, Identifiable, CaseIterable {
    case sun = "Sonnenfreund"
    case adventure = "Abenteuerfreund"
    case city = "Stadtfreund"
    case landscape = "Landschaftsfreund"
    case snow = "Schneefreund"
    
    var id: String { self.rawValue }
    
    func getImage() -> String {
        switch self {
        case .sun:
            "Sonne"
        case .adventure:
            "Abenteuer"
        case .city:
            "Stadt"
        case .landscape:
            "Landschaft"
        case .snow:
            "Schnee"
        }
    }
}
