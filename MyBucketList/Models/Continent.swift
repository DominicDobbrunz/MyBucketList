//
//  Continent.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 11.03.25.
//

import Foundation

struct Continent: Identifiable {
    let id = UUID()
    let name: String
    var countries: [Country]
}


let continents = [
    Continent(name: "Europa", countries: [
        Country(name: "Deutschland", flag: "🇩🇪", capital: "Berlin"),
        Country(name: "Frankreich", flag: "🇫🇷", capital: "Paris"),
        Country(name: "Italien", flag: "🇮🇹", capital: "Rom"),
        Country(name: "Spanien", flag: "🇪🇸", capital: "Madrid"),
        Country(name: "Portugal", flag: "🇵🇹", capital: "Lissabon"),
        Country(name: "Griechenland", flag: "🇬🇷", capital: "Athen"),
        Country(name: "Bulgarien", flag: "🇧🇬", capital: "Sofia"),
        Country(name: "Dänemark", flag: "🇩🇰", capital: "Koppenhagen"),
        Country(name: "Luxemburg", flag: "🇱🇺", capital: "Luxemburg"),
        Country(name: "Östereich", flag: "🇦🇹", capital: "Wien"),
        Country(name: "Schweiz", flag: "🇨🇭", capital: "Zürich"),
        Country(name: "Tschechien", flag: "🇨🇿", capital: "Prag"),
        Country(name: "Norwegen", flag: "🇳🇴", capital: "Oslo"),
        Country(name: "Schweden", flag: "🇸🇪", capital: "Stockholm"),
        Country(name: "Finnland", flag: "🇫🇮", capital: "Helsinki"),
        Country(name: "Polen", flag: "🇵🇱", capital: "Warschau"),
        Country(name: "Niederlande", flag: "🇳🇱", capital: "Amsterdam"),
        Country(name: "Belgien", flag: "🇧🇪", capital: "Brüssel"),
        Country(name: "Estland", flag: "🇪🇪", capital: "Tallin"),
        Country(name: "Irland", flag: "🇮🇪", capital: "Dublin"),
        Country(name: "Zypern", flag: "🇨🇾", capital: "Nikosia"),
        Country(name: "Lettland", flag: "🇱🇻", capital: "Riga")
    ]),
    Continent(name: "Asien", countries: [
        Country(name: "Japan", flag: "🇯🇵", capital: "Tokio"),
        Country(name: "China", flag: "🇨🇳", capital: "Peking"),
        Country(name: "Indien", flag: "🇮🇳", capital: "Neu-Delhi")
    ])
    // Füge weitere Kontinente und Länder hinzu
]
