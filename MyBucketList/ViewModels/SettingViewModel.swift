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
import Observation


final class SettingViewModel: ObservableObject {
    @AppStorage("lastLocationTrip")
    @ObservationIgnored
    var lastLocationTrip: String = "Berlin"
    @AppStorage("lastLocationWeather")
    @ObservationIgnored
    var lastLocationWeather: String = "Grand Canyon"
    var lastTripLocation: String {
        get { lastLocationTrip }
        set { lastLocationTrip = newValue }
    }
    
    var lastWheaterLocation: String {
        get { lastLocationWeather }
        set { lastLocationWeather = newValue }
    }
    @Published var name: String = ""
    @Published var birthdate: Date = Date()
    @Published var gender: String = "Männlich"
    @Published var occupation: String = "Sonnenfreund"
    @Published var isDarkMode: Bool = false
    @Published var isEditing: Bool = false
    @Published var isLocationEnabled: Bool = false
    @Published var selectedLanguage: String = "Deutsch"
    
    @Published var selectedOccupation: Occupation?

    let languages = ["Deutsch", "Englisch", "Französisch", "Spanisch", "Italienisch"]
    
    
    let genderOptions = ["Männlich", "Weiblich", "Divers"]
    let occupationOptions = ["Sonnenfreund", "Abenteuerfreund", "Stadtfreund", "Landschaftsfreund", "Schneefreund"]
    
    private var db = Firestore.firestore()
    private var userId: String? {
        Auth.auth().currentUser?.uid
    }

    init() {
        fetchUserData()
    }
    
    func fetchUserData() {
        guard let userId = userId else { return }
        db.collection("users").document(userId).getDocument { document, error in
            if let document = document, document.exists, let data = document.data() {
                self.name = data["name"] as? String ?? ""
                self.birthdate = (data["birthdate"] as? Timestamp)?.dateValue() ?? Date()
                self.gender = data["gender"] as? String ?? "Männlich"
                self.selectedOccupation = data["occupation"] as? Occupation ?? .sun
                self.isDarkMode = data["isDarkMode"] as? Bool ?? false
                
            }
        }
    }

    func saveUserData() {
        guard let userId = userId else { return }
        guard let occupation = selectedOccupation?.rawValue else { return }
        let userData: [String: Any] = [
            "name": name,
            "birthdate": birthdate,
            "gender": gender,
            "occupation": occupation,
            "isDarkMode": isDarkMode
        ]
        db.collection("users").document(userId).setData(userData, merge: true)
    }
}
