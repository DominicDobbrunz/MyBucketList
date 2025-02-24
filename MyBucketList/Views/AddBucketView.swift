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
    
    var onAdd: (Bucket) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Bucket-Titel", text: $title)
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button(action: {
                let newBucket = Bucket(title: title)
                onAdd(newBucket)
                dismiss()
            }) {
                Text("Hinzufügen")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
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
                    .background(Color.red1)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
        }
        .background(MeshGradientView().opacity(0.2).ignoresSafeArea())
    }
}

