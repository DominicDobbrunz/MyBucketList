//
//  AddLikeView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 25.02.25.
//
import SwiftUI


import SwiftUI
import PhotosUI

struct AddLikeView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var selectedImage: UIImage? = nil
    @State private var imagePickerItem: PhotosPickerItem? = nil
    @State private var uploadedImageURL: String? = nil
    @State private var isUploading = false
    var onAdd: (LikeItem) -> Void
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                // ✅ TextField für den Namen des Ortes
                TextField("Name des Ortes", text: $title)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                // ✅ Bildauswahl mit PhotosPicker
                PhotosPicker(selection: $imagePickerItem, matching: .images, photoLibrary: .shared()) {
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .cornerRadius(10)
                    } else {
                        Text("Bild auswählen")
                            .padding()
                            .background(Color.grey1.opacity(0.3))
                            .foregroundStyle(.black)
                            .cornerRadius(10)
                    }
                }
                .onChange(of: imagePickerItem) { oldItem, newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self),
                           let image = UIImage(data: data) {
                            selectedImage = image
                        }
                    }
                }
                
                // ✅ Button zum Hochladen und Hinzufügen
                if let selectedImage {
                    Button(action: {
                        Task {
                            isUploading = true
                            do {
                                // ✅ Bild hochladen
                                uploadedImageURL = try await ImgurService.uploadImage(selectedImage)
                                
                                // ✅ Like-Item erstellen und speichern
                                let newLike = LikeItem(
                                    title: title,
                                    imageName: uploadedImageURL ?? "placeholder" // ✅ Hochgeladene Bild-URL oder Platzhalter
                                )
                                onAdd(newLike) // ✅ Like in Firestore speichern
                                dismiss()
                            } catch {
                                print("Fehler beim Hochladen des Bildes: \(error)")
                            }
                            isUploading = false
                        }
                    }) {
                        if isUploading {
                            ProgressView()
                        } else {
                            Text("Hinzufügen")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.grey1)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                }
                
                // ✅ Button zum Abbrechen
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
            }
        }
        .background(MeshGradientView(opacity: 0.1).ignoresSafeArea())
    }
}
