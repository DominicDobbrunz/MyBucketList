//
//  MainView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI

struct MainView: View {
    @State private var bucketList: [BucketListItem] = []
    @State private var showEditView = false
    @State private var selectedBucket: BucketListItem?

    var body: some View {
        NavigationStack {
            ZStack {
                MeshGradientView()

                VStack {
                    if bucketList.isEmpty {
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
                            VStack(spacing: 20) {
                                ForEach(bucketList) { item in
                                    NavigationLink(value: item) {
                                        TileView(bucketItem: item)
                                    }
                                }
                            }
                            .padding()
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
                        bucketList.append(newItem)
                    }
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
