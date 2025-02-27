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
    @StateObject private var userViewModel = UserViewModel()
    @StateObject private var settingViewModel = SettingViewModel()
    //@StateObject private var mapViewModel = MapViewModel()
    @StateObject private var weatherVM = WeatherVM()
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            LoadScreenView()
                .environmentObject(userViewModel)
                .environmentObject(settingViewModel)
                //.environmentObject(mapViewModel)
                .environmentObject(weatherVM)
        }
    }
}

