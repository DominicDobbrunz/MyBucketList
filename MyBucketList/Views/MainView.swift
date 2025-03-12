//
//  MainView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI
import Firebase
import TipKit

struct MainView: View {
    @StateObject private var tileViewModel = TileViewModel()
    @State private var showEditView = false
    
    private let editTip: EditTip = .init()

    var body: some View {
        NavigationStack {
            ZStack {
                MeshGradientView()
                
                VStack {
                    if tileViewModel.tiles.isEmpty {
                        VStack(spacing: 10) {
                            Image("Strand")
                                .resizable()
                                .frame(width: 373, height: 200)
                                .cornerRadius(8)
                            
                            Text("Noch kein Bucket dann klicke das + ")
                                .font(.headline)
                                .foregroundColor(.black)
                            AnimationsView()
                        }
                        .padding()
                    } else {
                        ScrollView {
                            VStack(spacing: 10) {
                                ForEach(tileViewModel.tiles.reversed()) { item in
                                    // 🔹 Übergib die bucketListId korrekt
                                    navigationLink(for: item)
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
                                .popoverTip(editTip, arrowEdge: .bottom)
                                .onAppear {
                                    editTip.invalidate(reason: .actionPerformed)
                                }
                        }
                        .presentationBackground(.ultraThinMaterial)
                        
                    }
                }
                .sheet(isPresented: $showEditView) {
                    // 🔹 Übergib den bucketListId-Parameter
                    EditView(bucketListId: UUID().uuidString) { newItem in
                        tileViewModel.addTile(newItem)
                    }
                    .presentationBackground(.ultraThinMaterial)
                }
            }
            .navigationTitle("Bucket Listen")
        }
    }

    // 🔹 Separate Funktion zur Erstellung des NavigationLink
    private func navigationLink(for item: BucketListItem) -> some View {
        NavigationLink(
            destination: BucketListView(
                item: item,
                viewModel: BucketListViewModel(bucketListId: item.id.uuidString) // 🔹 bucketListId wird übergeben
            )
        ) {
            TileView(bucketItem: item)
        }
    }
}

#Preview {
    MainView()
}
