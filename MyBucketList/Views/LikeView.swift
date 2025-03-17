//
//  LikeView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//
import SwiftUI
import Firebase

struct LikeView: View {
    @StateObject private var likeVM = LikeViewModel()
    @State private var showAddLikeView = false
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]  // 2 Spalten
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(likeVM.likes) { like in
                        VStack {
                            if like.imageName == "placeholder" {
                                Image(systemName: "photo") // ✅ Standardbild anzeigen
                                    .resizable()
                                    //.scaledToFit()
                                    .frame(width: 135, height: 150)
                                    .cornerRadius(5)
                            } else {
                                AsyncImage(url: URL(string: like.imageName)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView() // ✅ Ladeindikator anzeigen
                                    case .success(let image):
                                        image
                                            .resizable()
                                            //.scaledToFit()
                                            .frame(width: 135, height: 150)
                                            .cornerRadius(5)
                                    case .failure:
                                        Image(systemName: "photo") // ✅ Platzhalter, falls Bild nicht geladen wird
                                            .resizable()
                                            //.scaledToFit()
                                            .frame(width: 130, height: 150)
                                            .cornerRadius(5)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                            }
                            
                            Text(like.title)
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        .frame(width: 170, height: 200)
                        .background(Color.green1.opacity(0.8))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                    
                    // "+" Button für neues Like hinzufügen
                    Button {
                        showAddLikeView = true
                    } label: {
                        VStack {
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.black)
                            
                            Text("Hinzufügen")
                                .foregroundColor(.black)
                        }
                        .frame(width: 160, height: 200)
                        .background(Color.grey1.opacity(0.3))
                        .cornerRadius(12)
                    }
                }
                .padding()
            }
            .navigationTitle("Highlights")
            .sheet(isPresented: $showAddLikeView) {
                AddLikeView { newLike in
                    likeVM.addLike(newLike) // ✅ Like in Firestore speichern
                }
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
                .presentationBackground(.ultraThinMaterial)
            }
            .background(MeshGradientView())
        }
    }
}

#Preview {
    LikeView()
}
