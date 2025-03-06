//
//  TilePicture.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 05.03.25.
//
import Foundation


enum TilePicture: String, Identifiable, CaseIterable, Codable {
    case sun = "Sonne"
    case adventure = "Abenteuer"
    case city = "Stadtfreund"
    case landscape = "Landschaft"
    case snow = "Schnee"
    
    
    var id: String { self.rawValue }
    
    func getImage() -> String {
        switch self {
        case .sun:
            "Sonne2"
        case .adventure:
            "Abenteuer2"
        case .city:
            "Stadt2"
        case .landscape:
            "Landschaft2"
        case .snow:
            "Schnee2"
        }
    }
}
