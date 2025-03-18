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
    @EnvironmentObject var tileViewModel: TileViewModel
    @State private var showDeleteAlert = false
    @State private var showShareView = false // Zustand für die ShareView

    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                Image("Hintergrund3")
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
                        .foregroundColor(.black)
                    Text(bucketItem.location)
                        .font(.title3)
                        .foregroundColor(.black)

                    Text(bucketItem.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    Label(bucketItem.companion.rawValue, systemImage: "person.2.fill")
                        .font(.footnote)
                        .foregroundColor(.black.opacity(0.8))
                }
                .padding(16)

                HStack {
                    Spacer()
                    // 🔹 Share-Button
                    Button(action: {
                        showShareView = true // Zeige die ShareView an
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundStyle(.black)
                    }
                    .padding(.trailing, 8)

                    // 🔹 Delete-Button
                    Button {
                        showDeleteAlert = true
                    } label: {
                        Image(systemName: "trash")
                            .font(.title2)
                            .foregroundColor(.black.opacity(0.8))
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
                Image(bucketItem.picture.getImage())
                    .resizable()
                    .frame(width: 350, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 5)
                    .padding(.top, 120)
            }
        }
        .padding(.horizontal, 30)
        .alert("Bucket löschen?", isPresented: $showDeleteAlert) {
            Button("Abbrechen", role: .cancel) {}
            Button("Löschen", role: .destructive) {
                withAnimation {
                    tileViewModel.removeTile(bucketItem)
                }
            }
        } message: {
            Text("Möchtest du diesen Bucket wirklich entfernen?")
        }
        // 🔹 Zeige die ShareView an, wenn showShareView true ist
        .sheet(isPresented: $showShareView) {
            // 🔹 Vordefinierte Nachricht mit Beispielen
            let shareMessage = """
            Ich plane einen tollen Trip! 🎉

            Ziel: \(bucketItem.title)
            Ort: \(bucketItem.location)
            Land: \(bucketItem.country)

            Lass uns gemeinsam Abenteuer erleben! 🌍
            """
            ShareView(items: [shareMessage])
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
                .presentationBackground(.ultraThinMaterial)
        }
    }
}





              
