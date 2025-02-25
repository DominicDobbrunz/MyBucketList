//
//  BucketListView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 18.02.25.
//

import SwiftUI

struct BucketListView: View {
    @Environment(\.dismiss) var dismiss
    var item: BucketListItem
    @State private var buckets: [Bucket] = []
    @State private var showAddBucketView = false
    @State private var showCompletionAlert = false
    
    var body: some View {
        ZStack {
            MeshGradientView()
            VStack {
                Image("Schatten")
                    .resizable()
                    .frame(width: 373, height: 120)
                    .cornerRadius(8)
                    .scaledToFit()
                    .clipped()
                    .overlay(
                        VStack {
                            Spacer()
                            Text(item.title)
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.black)
                                .shadow(radius: 10)
                            Text("Mit: \(item.companion.rawValue)")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                            .padding(),
                        alignment: .bottomLeading
                    )
                
                List {
                    ForEach(buckets.indices, id: \.self) { index in
                        HStack {
                            Text("\(index + 1).")
                                .font(.headline)
                                .foregroundColor(.gray)
                            Text(buckets[index].title)
                            Spacer()
                            if buckets[index].completed {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            } else {
                                Button(action: {
                                    buckets[index].completed = true
                                    checkIfAllCompleted()
                                }) {
                                    Image(systemName: "circle")
                                        .foregroundColor(.gray)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Bucket Liste")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        showAddBucketView = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .background(.green1)
                            .foregroundColor(.black)
                            .padding(.top, 50)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {
                                    dismiss()
                                }) {
                                    Image(systemName: "chevron.left")
                                        .font(.title2)
                                        .foregroundColor(.black)
                                }
                            }
                        }
            .sheet(isPresented: $showAddBucketView) {
                AddBucketView { newBucket in
                    buckets.append(newBucket)
                }
                .presentationDetents([.medium, .large]) // Öffnet das Sheet zunächst auf mittlerer Höhe
                .presentationDragIndicator(.visible) // Zeigt einen Zieh-Indikator
            }
            .alert("Glückwunsch!", isPresented: $showCompletionAlert) {
                Button("OK") {}
            } message: {
                Text("Du hast deine gesamte Liste erfolgreich abgeschlossen!")
            }
        }
    }
    
    private func checkIfAllCompleted() {
        if buckets.allSatisfy({ $0.completed }) {
            showCompletionAlert = true
        }
    }
}
