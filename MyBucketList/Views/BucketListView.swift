//
//  BucketListView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 18.02.25.
//

import SwiftUI

struct BucketListView: View {
    var item: BucketListItem
    @State private var buckets: [Bucket] = []
    @State private var showAddBucketView = false
    @State private var showCompletionAlert = false
    
    var body: some View {
        ZStack {
            VStack {
                Image("Schatten")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .infinity)
                    .frame(height: 200)
                    .clipped()
                    .overlay(
                        VStack {
                            Spacer()
                            Text(item.title)
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                                .shadow(radius: 10)
                            Text("Mit: \(item.companion.rawValue)")
                                .font(.headline)
                                .foregroundColor(.white)
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
            .navigationTitle("Bucket Details")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        showAddBucketView = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.green)
                            .padding(.top, 20)
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
