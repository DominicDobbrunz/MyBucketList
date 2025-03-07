//
//  AddBucketView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 18.02.25.
//

import SwiftUI

struct AddBucketView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var title: String = ""
    var onAdd: (BucketListItem) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Bucket!", text: $title)
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button(action: {
                            // ✅ Überprüfen Sie, ob der Benutzer angemeldet ist
                            if let userID = userViewModel.userID {
                                let newBucket = BucketListItem(
                                    userId: userID, // ✅ userID übergeben
                                    title: title,
                                    country: "Unbekannt",
                                    location: "Unbekannt",
                                    companion: .alone,
                                    picture: .sun,
                                    completed: false
                                )
                                onAdd(newBucket)
                                dismiss()
                            } else {
                                print("Benutzer ist nicht angemeldet.")
                            }
            }) {
                Text("Hinzufügen")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.grey1)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Button(action: {
                dismiss()
            }) {
                Text("Abbrechen")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.grey1)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .background(MeshGradientView().opacity(0.2).ignoresSafeArea())
    }
}



