//
//  BucketListView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 18.02.25.
//

import SwiftUI
import Firebase

struct BucketListView: View {
    @Environment(\.dismiss) var dismiss
    var item: BucketListItem
    @ObservedObject var viewModel: BucketListViewModel // ✅ Hier als @ObservedObject übergeben
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
                        VStack(alignment: .leading) { // ✅ Schrift untereinander setzen
                            Spacer()
                            Text(item.title)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.black)
                                .shadow(radius: 10)
                                .frame(maxWidth: .infinity, alignment: .leading) // Links ausrichten
                            
                            Text("Mit: \(item.companion.rawValue)")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading) // Links ausrichten
                        }
                        .padding(),
                        alignment: .bottomLeading
                    )
                
                WeatherView(item: item)
                
                VStack {
                    Text("Bucket Liste")
                        .font(.headline)
                        .foregroundStyle(.black)
                    
                    List {
                        bucketListSection()
                    }
                    .listStyle(InsetGroupedListStyle())
                    .scrollContentBackground(.hidden)
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        showAddBucketView = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding(.bottom, 50)
                    }
                }
                
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
                    viewModel.addBucket(newBucket) // ✅ Speichern über ViewModel
                }
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
                .presentationBackground(.ultraThinMaterial)
            }
            
            .alert("Glückwunsch!", isPresented: $showCompletionAlert) {
                Button("OK") {}
            } message: {
                Text("Du hast deine gesamte Liste erfolgreich abgeschlossen!")
            }
        }
    }
    
    private func checkIfAllCompleted() {
        if viewModel.buckets.allSatisfy({ $0.completed }) {
            showCompletionAlert = true
        }
    }
    
    @ViewBuilder
    private func bucketListSection() -> some View {
        ForEach(viewModel.buckets) { bucket in
            HStack {
                Text(bucket.title)
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading) // Links ausrichten
                
                if bucket.completed {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                } else {
                    Button(action: {
                        if let index = viewModel.buckets.firstIndex(where: { $0.id == bucket.id }) {
                            viewModel.markAsCompleted(index: index)
                            checkIfAllCompleted()
                        }
                    }) {
                        Image(systemName: "circle")
                            .foregroundColor(.gray)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            .padding(.vertical, 8)
        }
    }
}


#Preview {
    BucketListView( item: BucketListItem(title: "Strand", country: "Griechenland", location: "Athen", companion: .alone), viewModel: BucketListViewModel())
}
