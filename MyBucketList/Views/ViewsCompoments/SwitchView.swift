//
//  SwitchView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI

struct SwitchView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    
    var body: some View {
        if userViewModel.isUserSignedIn {
            TabulatorView()
        } else {
            LoginView()
        }
    }
}

//#Preview {
//    @Previewable @StateObject var userVM: UserViewModel = .init()
//    SwitchView()
//        .environmentObject(userVM)
//}
