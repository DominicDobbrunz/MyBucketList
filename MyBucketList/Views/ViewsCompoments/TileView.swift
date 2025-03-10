//
//  TileView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 17.02.25.
//

import SwiftUI
import Firebase

struct TileView: View {
    var bucketItem: BucketListItem
    @EnvironmentObject var tileViewModel: TileViewModel // Zugriff auf das ViewModel
//    @EnvironmentObject var userViewModel: UserViewModel
    @State private var showDeleteAlert = false // Zeigt den Bestätigungs-Alert an

    var body: some View {
        VStack {
            // 🔹 Prüfen, ob das Element noch existiert
//            if tileViewModel.tiles.contains(where: { $0.id == bucketItem.id }) {
                ZStack(alignment: .topLeading) {
                    Image("HintergrundG")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width - 20, height: 250)
                        .blur(radius: 40)
                        .cornerRadius(14)
                        .opacity(0.3)
                        .shadow(radius: 12)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(bucketItem.country)
                            .font(.footnote)
                            .foregroundColor(.white)
                        Text(bucketItem.location)
                            .font(.title3)
                            .foregroundColor(.white)

                        Text(bucketItem.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        Label(bucketItem.companion.rawValue, systemImage: "person.2.fill")
                            .font(.footnote)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(16)

                    // 🔹 Menü-Button mit Kontextmenü für Löschen
                    HStack {
                        Spacer()
                        Button {
                            showDeleteAlert = true
                        } label: {
                            Image(systemName: "trash")
                                .font(.title2)
                                .foregroundColor(.white.opacity(0.8))
                                .padding()
                        }
                        .contextMenu {
                            Button(role: .destructive) {
                                showDeleteAlert = true
                            } label: {
                                Label("Löschen", systemImage: "trash")
                            }
                        }
                    }
                }
                .overlay {
                    Image(bucketItem.picture.getImage()) // 🔹 Gewähltes Bild anzeigen
                        .resizable()
                        .frame(width: 350, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 5)
                        .padding(.top, 120)
                }
            //}
        }
        .padding(.horizontal, 30)

        // ✅ Bestätigungs-Alert für das Löschen
        .alert("Bucket löschen?", isPresented: $showDeleteAlert) {
            Button("Abbrechen", role: .cancel) {}
            Button("Löschen", role: .destructive) {
                withAnimation {
                    tileViewModel.removeTile(bucketItem) // 🔥 Sicheres Entfernen
                }
            }
        } message: {
            Text("Möchtest du diesen Bucket wirklich entfernen?")
        }
    }
}



//#Preview {
//    TileView(bucketItem: BucketListItem(title: "Abenteuer", country: "Australien", location: "Sydney", companion: .partner, picture: .sun))
//}



//        .swipeActions(edge: .trailing) {
//                    Button {
//                        tileViewModel.removeTile(bucketItem)
//                    } label: {
//                        Label("Löschen", systemImage: "trash")
//                    }
//                }
