//
//  MainView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI

struct MainView: View {
    @StateObject private var tileViewModel = TileViewModel()
    @State private var bucketList: [BucketListItem] = []
    @State private var showEditView = false
    @State private var selectedBucket: BucketListItem?

    var body: some View {
            NavigationStack {
                ZStack {
                    MeshGradientView()

                    VStack {
                        if tileViewModel.tiles.isEmpty { // ✅ Prüft direkt auf gespeicherte Tiles
                            VStack(spacing: 10) {
                                Image(systemName: "house")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.gray.opacity(0.5))

                                Text("Noch kein Bucket")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        } else {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 16) {
                                    ForEach(tileViewModel.tiles) { item in
                                        TileView(bucketItem: item)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: { showEditView = true }) {
                                Image(systemName: "plus")
                                    .font(.title2)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    
                    // ✅ EditView speichert neue Tiles direkt ins ViewModel
                    .sheet(isPresented: $showEditView) {
                        EditView { newItem in
                            tileViewModel.tiles.append(newItem) // ✅ Speicherung ins ViewModel
                        }
                        .presentationBackground(.ultraThinMaterial)
                    }

                    .navigationDestination(for: BucketListItem.self) { item in
                        BucketListView(item: item)
                    }
                }
            }
        }
}



//#Preview {
//    MainView()
//        .environmentObject(UserViewModel())
//}
//
