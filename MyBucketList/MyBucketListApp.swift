//
//  MyBucketListApp.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

@main
struct MyApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            LoadScreenView()
                .environmentObject(UserViewModel())
                .environmentObject(SettingViewModel())
        }
    }
}

