//
//  AddBucketView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 18.02.25.
//

import SwiftUI

struct AddBucketView: View {
    @Environment(\.dismiss) private var dismiss
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
                let newBucket = BucketListItem(title: title, country: "Unbekannt", location: "Unbekannt", companion: .alone, completed: false)
                onAdd(newBucket)
                dismiss()
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



