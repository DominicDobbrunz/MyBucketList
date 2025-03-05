//
//  MainView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI
import Firebase

struct MainView: View {
    //@StateObject private var bucketListViewModel = BucketListViewModel()
    @StateObject private var tileViewModel = TileViewModel()
    @State private var bucketList: [BucketListItem] = []
    @State private var showEditView = false
    @State private var selectedBucket: BucketListItem?
    
    var body: some View {
        NavigationStack {
            ZStack {
                MeshGradientView() // ✅ Hintergrund bleibt konsistent
                
                VStack {
                    if tileViewModel.tiles.isEmpty {
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
                        ScrollView {
                            VStack(spacing: 10) {
                                ForEach(tileViewModel.tiles.reversed()) { item in
                                    NavigationLink(destination: BucketListView(item: item, viewModel: BucketListViewModel())) {
                                        TileView(bucketItem: item)
                                    }
                                }
                            }
                            .padding(.vertical, 10)
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
                .sheet(isPresented: $showEditView) {
                    EditView { newItem in
                        tileViewModel.tiles.insert(newItem, at: 0) // ✅ Neueste Einträge oben
                    }
                    .presentationBackground(.ultraThinMaterial)
                }
                
            }
        }
    }
}
