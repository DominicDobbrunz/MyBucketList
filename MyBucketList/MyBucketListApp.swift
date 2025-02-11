//
//  MyBucketListApp.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI
import Firebase

@main
struct MyApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            SwitchView()
                .environmentObject(UserViewModel())
        }
    }
}

