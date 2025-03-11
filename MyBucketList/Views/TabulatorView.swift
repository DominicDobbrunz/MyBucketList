//
//  TabulatorView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI

struct TabulatorView: View {
    @State var selectedTab: Tap = .bucket
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                switch selectedTab {
                    case .bucket:
                        MainView()
                    case .erinnerrung:
                        LikeView()
                    case .karte:
                    ContinentView()
                    case .profil:
                        ProfilView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            Spacer(minLength: 0)
            TabuView(selectedTab: $selectedTab)
                .padding(.bottom, 20)
                .frame(height: 80)
        }
        .edgesIgnoringSafeArea(.bottom) 
    }
}

//#Preview {
//    TabulatorView()
//}


