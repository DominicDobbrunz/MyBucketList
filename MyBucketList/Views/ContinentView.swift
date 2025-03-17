//
//  ContinentView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 11.03.25.
//
import Foundation
import SwiftUI
import MapKit

struct ContinentView: View {
    @State private var continentsData = continents
    @State private var showMapView = false
        
    var body: some View {
        NavigationStack {
            ZStack{
                MeshGradientView()
                VStack {
                    List {
                        ForEach($continentsData) { $continent in
                            Section(header: Text(continent.name).font(.headline)) {
                                ForEach($continent.countries) { $country in
                                    HStack {
                                        Text(country.flag)
                                        VStack(alignment: .leading) {
                                            Text(country.name)
                                            Text(country.capital)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                        Spacer()
                                        Button(action: {
                                            country.isChecked.toggle()
                                        }) {
                                            Image(systemName: country.isChecked ? "checkmark.square.fill" : "square")
                                                .foregroundColor(country.isChecked ? .red : .gray)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(GroupedListStyle())
                    .scrollContentBackground(.hidden)
                    
                    NavigationLink(destination: MapView()) {
                        HStack {
                            Image(systemName: "map")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("Auf zur Karte")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.grey1)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                }
                .navigationTitle("Welt Liste")
                //.navigationBarBackButtonHidden(true)
                .background(Color.clear)
            }
        }
    }
}

#Preview {
    ContinentView()
}
