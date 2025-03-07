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
                                .popoverTip(editTip, arrowEdge: .bottom)
                                .onAppear {
                                    // nach der ersten Anzeige deaktivieren
                                    editTip.invalidate(reason: .actionPerformed)
                                }
                        }
                        .presentationBackground(.ultraThinMaterial)
                        
                    }
                }
                .sheet(isPresented: $showEditView) {
                    EditView { newItem in
                        tileViewModel.addTile(newItem)
                    }
                    .presentationBackground(.ultraThinMaterial)
                }
            }
        }
    }
}

#Preview {
    MainView()
}
