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
    
    @State private var showDeleteAlert = false // Zeigt den Bestätigungs-Alert an

    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                Image("HintergrundG")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 20, height: 250)
                    .blur(radius: 40)
                    .cornerRadius(14)
                    .opacity(0.7)
                    .shadow(radius: 12)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(bucketItem.country)
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.7))
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
                
                // 🔹 3-Punkte-Menü zum Löschen
                HStack {
                    Spacer()
                    Button {
                        
                       // kommen noch Funktionen hinzu.
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                            .foregroundColor(.white.opacity(0.8))
                            .padding()
                    }
                }
            }
            .overlay {
                            Image(bucketItem.picture.getImage()) // Gewähltes Bild aus TilePicture
                                .resizable()
                                //.scaledToFit()
                                .frame(width: 350, height: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .shadow(radius: 5)
                                .padding(.top, 120)
            }
                    }
                    .padding(.horizontal, 30)
                    
        .padding(.horizontal, 30)
        .swipeActions(edge: .trailing) {
                    Button {
                        tileViewModel.removeTile(bucketItem)
                    } label: {
                        Label("Löschen", systemImage: "trash")
                    }
                }
        
        // ✅ Bestätigungs-Alert für das Löschen
        .alert("Bucket löschen?", isPresented: $showDeleteAlert) {
            Button("Abbrechen", role: .cancel) {} // Schließt den Alert
                .foregroundStyle(.black)
            Button("Löschen", role: .destructive) {
                tileViewModel.removeTile(bucketItem)
            }
        } message: {
            Text("Möchtest du diesen Bucket wirklich entfernen?")
        }
    }
}


#Preview {
    TileView(bucketItem: BucketListItem(title: "Abenteuer", country: "Australien", location: "Sydney", companion: .partner, picture: .sun))
}


//.resizable()
//.frame(width: 350, height: 120)
//.scaledToFit()
//.clipShape(RoundedRectangle(cornerRadius: 20))
//.shadow(radius: 10)
//.padding(.top, 120)

