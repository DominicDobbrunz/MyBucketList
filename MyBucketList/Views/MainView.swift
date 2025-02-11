//
//  MainView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        ZStack {
            Color.red1.ignoresSafeArea()
            VStack {
                    Text("Willkommen, \(userViewModel.userName)!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom,60)
                   }
            .padding()
            Spacer()
        }
    }
}


#Preview {
    MainView()
        .environmentObject(UserViewModel())
}

