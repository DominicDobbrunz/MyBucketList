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
                        MapView()
                    case .profil:
                        ProfilView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Nimmt die ganze Höhe
            
            Spacer(minLength: 0) // Sorgt dafür, dass das Tab-Menü unten bleibt
            
            TabuView(selectedTab: $selectedTab)
                .padding(.bottom, 20) // Fügt Abstand unten hinzu für bessere Platzierung
                .frame(height: 80) // Fixe Höhe des Tab-Menüs, damit es nicht zu groß ist
        }
        .edgesIgnoringSafeArea(.bottom) // Damit das Tab-Menü nicht zu hoch sitzt
    }
}

//#Preview {
//    TabulatorView()
//}


