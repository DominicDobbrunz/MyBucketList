//
//  TabulatorView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI

struct TabulatorView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Bucket")
                }
            LikeView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Erinnerrung")
                }
            MapView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Karte")
                }
            ProfilView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profil")
                }
                    
        }
    }
}

#Preview {
    TabulatorView()
}

