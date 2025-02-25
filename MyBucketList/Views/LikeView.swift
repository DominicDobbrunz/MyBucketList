//
//  LikeView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI

struct LikeView: View {
    @State private var likes: [LikeItem] = []  // Liste der Lieblingsorte
    @State private var showAddLikeView = false
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]  // 2 Spalten
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    // Vorhandene Likes anzeigen
                    ForEach(likes) { like in
                        VStack {
                            Image(like.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(10)
                            
                            Text(like.title)
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        .frame(width: 160, height: 200)
                        .background(Color.green1.opacity(0.8))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                    
                    // "+" Button für neues Like hinzufügen
                    Button {
                        showAddLikeView = true
                    } label: {
                        VStack {
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.black)
                            
                            Text("Hinzufügen")
                                .foregroundColor(.black)
                        }
                        .frame(width: 160, height: 200)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(12)
                    }
                }
                .padding()
            }
            .navigationTitle("Highligths")
            .sheet(isPresented: $showAddLikeView) {
                AddLikeView { newLike in
                    likes.append(newLike)  // Neues Like zur Liste hinzufügen
                }
            }
            .background(MeshGradientView())
        }
    }
}


#Preview {
    LikeView()
}
