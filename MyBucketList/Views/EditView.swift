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
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var title: String = ""
    @State private var country: String = ""
    @State private var companion: Companion = .alone
    @State private var location: String = ""
    @State private var selectedPicture: TilePicture = .sun
    var bucketListId: String
    
    var onSave: (BucketListItem) -> Void
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                
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

                VStack {
                    HStack {
                        Text("Wähle ein Bild")
                            .font(.headline)
                            .foregroundColor(.black)
                        Spacer()
                        Picker("Bild auswählen", selection: $selectedPicture) {
                            ForEach(TilePicture.allCases) { picture in
                                Text(picture.rawValue).tag(picture)
                            }
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                    .background(Color.grey1.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    Image(selectedPicture.getImage())
                        .resizable()
                        .frame(width: 253, height: 100)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding()
                }
                
                Button(action: {
                                if let userID = userViewModel.userID {
                                    let newBucket = BucketListItem(
                                        userId: userID, 
                                        bucketListId: bucketListId,
                                        title: title,
                                        country: country,
                                        location: location,
                                        companion: companion,
                                        picture: selectedPicture,
                                        completed: false
                                    )
                                    onSave(newBucket)
                                    dismiss()
                                } else {
                                    print("Benutzer ist nicht angemeldet.")
                                }
                }) {
                    Text("Hinzufügen")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.grey1)
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
                        .background(Color.grey1)
                        .foregroundColor(.black)
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
