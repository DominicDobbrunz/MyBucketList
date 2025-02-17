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
    
    var onSave: (BucketListItem) -> Void
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Titel-Eingabe
                TextField("Titel", text: $title)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                // Land-Eingabe
                TextField("Land", text: $country)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                // Companion Picker (als Liste)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Mit wem?")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                    
                    Picker("Mit wem?", selection: $companion) {
                        ForEach(Companion.allCases) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(.inline) // Listendarstellung des Pickers
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                
                // Speichern-Button
                Button(action: {
                    let newItem = BucketListItem(title: title, country: country, companion: companion)
                    onSave(newItem)
                    dismiss()
                }) {
                    Text("Hinzufügen")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green1) // Grüne Hintergrundfarbe
                        .foregroundColor(.black) // Weiße Schriftfarbe
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                // Abbrechen-Button (Schwarz)
                Button(action: {
                    dismiss()
                }) {
                    Text("Abbrechen")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red1)
                        .foregroundColor(.black) // Schwarze Schriftfarbe
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                Spacer()
            }
            .navigationTitle("Neuer Bucket")
            .background(MeshGradientView().opacity(0.2).ignoresSafeArea()) // Farbiger Hintergrund
        }
    }
}


//#Preview {
//    EditView()
//}
