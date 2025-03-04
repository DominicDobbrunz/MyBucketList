//
//  EditView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 17.02.25.
//

import SwiftUI
import Foundation
import Firebase



struct EditView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var country: String = ""
    @State private var companion: Companion = .alone
    @State private var location: String = ""
    
    var onSave: (BucketListItem) -> Void
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                TextField("Titel", text: $title)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                TextField("Land.", text: $country)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                TextField("Ort", text: $location)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                CompanionPicker(selection: $companion)

                Button(action: {
                    let newItem = BucketListItem(title: title,
                                                 country: country,
                                                 location: location,
                                                 companion: companion
                    )
                    onSave(newItem)
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
                
                Spacer()
            }
            .navigationTitle("Neuer Bucket")
            .background(MeshGradientView().opacity(0.2).ignoresSafeArea())
        }
    }
}


//#Preview {
//    EditView()
//}
