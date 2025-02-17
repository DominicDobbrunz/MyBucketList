//
//  SettingViewModel.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 13.02.25.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

final class SettingViewModel: ObservableObject {
    
    @State private var name: String = ""
    @State private var birthdate: Date = Date()
    @State private var gender: String = "Männlich"
    @State private var occupation: String = "Sonnenfreund"
//DarkMode
//Sprache
    
    let genderOptions = ["Männlich", "Weiblich", "Divers"]
    let occupationOptions = ["Sonnenfreund", "Abenteuerfreund", "Stadtfreund", "Landschaftsfreund"]
    
}
