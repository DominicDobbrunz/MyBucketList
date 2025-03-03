//
//  MainView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI
import Firebase

struct MainView: View {
    @StateObject private var bucketListViewModel = BucketListViewModel()
    //@StateObject private var tileViewModel = TileViewModel()
    @State private var bucketList: [BucketListItem] = []
    @State private var showEditView = false
    @State private var selectedBucket: BucketListItem?

    var body: some View {
            NavigationStack {
                ZStack {
                    MeshGradientView() // ✅ Hintergrund bleibt konsistent

                    VStack {
                                       if bucketListViewModel.buckets.isEmpty {
                                           VStack(spacing: 10) {
                                               Image(systemName: "house")
                                                   .resizable()
                                                   .scaledToFit()
                                                   .frame(width: 100, height: 100)
                                                   .foregroundColor(.gray.opacity(0.5))

                                               Text("Noch kein Bucket")
                                                   .font(.headline)
                                                   .foregroundColor(.grey1)
                                           }
                                           .padding()
                                       } else {
                                           ScrollView {
                                               ForEach(bucketListViewModel.buckets) { item in
                                                   NavigationLink(destination: BucketListView(item: item, viewModel: bucketListViewModel)) {
                                                       TileView(bucketItem: item)
                                                   }
                                               }
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
                            BucketListViewModel.tiles.append(newItem) // ✅ Neues Item wird oben angezeigt
                        }
                        .presentationBackground(.ultraThinMaterial)
                    }
                }
            }
        }}



//#Preview {
//    MainView()
//        .environmentObject(UserViewModel())
//}
//
/*
 
 */
