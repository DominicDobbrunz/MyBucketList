//
//  LoadScreenView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 11.02.25.
//


import SwiftUI
import MapKit

struct LoadScreenView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @EnvironmentObject private var settingViewModel: SettingViewModel
    
    
    var body: some View {
        LoadView(title: "My Bucket List", image: .berge, content: SwitchView())
//            .onAppear {
//                  UIFont.familyNames.forEach { family in
//                    print("Family: \(family)")
//                    UIFont.fontNames(forFamilyName: family).forEach { font in
//                      print("Font: \(font)")
//                    }
//                  }
//                }
    }
}

#Preview {
    @Previewable @StateObject var userVM: UserViewModel = .init()
    LoadScreenView()
        .environmentObject(userVM)
        .environmentObject(SettingViewModel())
        
        
}
