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
    @StateObject private var viewModel = BucketListViewModel()
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
                                .font(.title2)
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
                
                // ✅ Wetter für den jeweiligen Ort anzeigen
                WeatherView(item: item)
                Spacer()
                VStack {
                    Text("Bucket Liste")
                        .font(.headline)
                        .foregroundStyle(.black)
                    
                    List {
                        bucketListSection()
                    }
                    .listStyle(InsetGroupedListStyle())
                    .scrollContentBackground(.hidden)
                    //.background(MeshGradientView())
                }
            }
            .onAppear {
                        // ✅ Falls die Liste das erste Mal geöffnet wird, leeren wir sie
                        if viewModel.isFirstOpen {
                            viewModel.buckets = []
                            viewModel.isFirstOpen = false // Danach normal speichern
                        } else {
                            viewModel.loadFromUserDefaults()
                        }
                    }
            .navigationBarBackButtonHidden(true)
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
            
            // ✅ Sheet für das Hinzufügen von Buckets
            .sheet(isPresented: $showAddBucketView) {
                AddBucketView { newBucket in
                    viewModel.buckets.append(newBucket)
                    viewModel.saveToUserDefaults()
                }
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
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
            HStack { // ✅ Platz für den Haken erstellen
                Text(bucket.title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Spacer()
                
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
    BucketListView( item: BucketListItem(title: "Strand", country: "Griechenland", location: "Athen", companion: .alone))
}
