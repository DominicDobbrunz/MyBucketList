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
        Country(name: "Indien", flag: "🇮🇳", capital: "Neu-Delhi"),
        Country(name: "Ägypten", flag: "🇪🇬", capital: "Kairo"),
        Country(name: "Bahrain", flag: "🇧🇭", capital: "Manama"),
        Country(name: "Indonesien", flag: "", capital: "Jakarta"),
        Country(name: "Katar", flag: "🇶🇦", capital: "Doha"),
        Country(name: "Malediven", flag: "🇲🇻", capital: "Male"),
        Country(name: "Philippinen", flag: "🇵🇭", capital: "Manila"),
        Country(name: "Singapur", flag: "🇸🇬", capital: ""),
        Country(name: "Thailand", flag: "🇹🇭", capital: "Bangkok"),
        Country(name: "Türkei", flag: "🇹🇷", capital: "Ankara"),
        Country(name: "Vietnam", flag: "🇻🇳", capital: "Hanoi")
    ]),
    // Füge weitere Kontinente und Länder hinzu
    Continent(name: "Amerika", countries: [
        Country(name: "Argentinien", flag: "🇦🇷", capital: "Buenos Aires"),
        Country(name: "Bahamas", flag: "🇧🇸", capital: "Nassau"),
        Country(name: "Brasilien", flag: "🇧🇷", capital: "Brasilia"),
        Country(name: "Chile", flag: "🇨🇱", capital: "Santiago de Chile"),
        Country(name: "Costa Rica", flag: "🇨🇷", capital: "San Jose"),
        Country(name: "Dominikasche Republik", flag: "🇩🇴", capital: "Santo Domingo"),
        Country(name: "Jamaika", flag: "🇯🇲", capital: "Kingston"),
        Country(name: "Kanada", flag: "🇨🇦", capital: "Ottawa"),
        Country(name: "Kuba", flag: "🇨🇺", capital: "Havanna"),
        Country(name: "Venezuela", flag: "🇻🇪", capital: "Caracas"),
        Country(name: "Vereinigte Staaten", flag: "🇺🇸", capital: "Washington D.C.")
    ]),
    Continent(name: "Australien & Ozeanien", countries: [
        Country(name: "Australien", flag: "🇦🇺", capital: "Canberra"),
        Country(name: "Fidschi", flag: "🇫🇯", capital: "Suva"),
        Country(name: "Neuseeland", flag: "🇳🇿", capital: "Wellington"),
        Country(name: "Samoa", flag: "🇼🇸", capital: "Apia")
    ])
]
