//
//  LikeView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//
import SwiftUI
import Firebase
import TipKit

struct LikeView: View {
    @StateObject private var likeVM = LikeViewModel()
    @State private var showAddLikeView = false
    private let addLikeTip = AddLikeTip()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]  // 2 Spalten
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    // Vorhandene Likes anzeigen
                    ForEach(likeVM.likes) { like in
                        VStack {
                            Image(like.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 150)
                                .cornerRadius(5)
                            
                            Text(like.title)
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        .frame(width: 160, height: 200)
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
                        .popoverTip(addLikeTip, arrowEdge: .bottom)
                        .onAppear {
                            // nach der ersten Anzeige deaktivieren
                            addLikeTip.invalidate(reason: .actionPerformed)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Highlights")
            .sheet(isPresented: $showAddLikeView) {
                AddLikeView { newLike in
                    likeVM.addLike(newLike) // ✅ Like über das ViewModel hinzufügen
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
