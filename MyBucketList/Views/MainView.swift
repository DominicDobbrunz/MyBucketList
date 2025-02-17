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
    
    var body: some View {
        NavigationStack {
            ZStack{
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
                        List {
                            ForEach(bucketList) { item in
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.title)
                                            .font(.headline)
                                        Text(item.country)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                        Text("Mit: \(item.companion.rawValue)")
                                            .font(.footnote)
                                            .foregroundColor(.blue)
                                    }
                                    Spacer()
                                }
                                .padding(.vertical, 8)
                            }
                        }
                    }
                }
                .navigationTitle("Bucket List")
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
            }
        }
    }
}

//#Preview {
//    MainView()
//        .environmentObject(UserViewModel())
//}
//
