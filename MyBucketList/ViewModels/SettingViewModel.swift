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
    
    @Published var name: String = ""
    @Published var birthdate: Date = Date()
    @Published var gender: String = "Männlich"
    @Published var occupation: String = "Sonnenfreund"
    @Published var isDarkMode: Bool = false
    @Published var isEditing: Bool = false
    
    let genderOptions = ["Männlich", "Weiblich", "Divers"]
    let occupationOptions = ["Sonnenfreund", "Abenteuerfreund", "Stadtfreund", "Landschaftsfreund"]
    
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
                self.occupation = data["occupation"] as? String ?? "Sonnenfreund"
                self.isDarkMode = data["isDarkMode"] as? Bool ?? false
            }
        }
    }

    func saveUserData() {
        guard let userId = userId else { return }
        let userData: [String: Any] = [
            "name": name,
            "birthdate": birthdate,
            "gender": gender,
            "occupation": occupation,
            "isDarkMode": isDarkMode
        ]
        db.collection("users").document(userId).setData(userData, merge: true)
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Fehler beim Logout: \(error.localizedDescription)")
        }
    }
}
