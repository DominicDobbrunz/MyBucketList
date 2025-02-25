//
//  AddLikeView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 25.02.25.
//


import SwiftUI

struct AddLikeView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var imageName: String = "placeholder" // Standardbild
    
    var onAdd: (LikeItem) -> Void
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                TextField("Name des Ortes", text: $title)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button(action: {
                    let newLike = LikeItem(title: title, imageName: imageName)
                    onAdd(newLike)
                    dismiss()
                }) {
                    Text("Hinzufügen")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green1)
                        .foregroundColor(.black)
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
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            
        }
        .background(MeshGradientView(opacity: 0.1).ignoresSafeArea())
    }
}
