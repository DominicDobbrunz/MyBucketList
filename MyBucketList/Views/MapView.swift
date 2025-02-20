//
//  MapView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var searchText = ""  // Suchtext
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 52.5502410, longitude: 13.7792933),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )

    var body: some View {
        ZStack{
            MeshGradientView()
            VStack {
                // 🔍 Suchleiste
                TextField("Ort suchen...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .padding(.top,90)
                
                // 🗺 Karte
                Map(coordinateRegion: $region)
                    .frame(height: 350)  // Höhe der Karte festlegen
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                // ℹ️ Info-Bereich
                VStack(alignment: .leading) {
                    Text("Ort: Bruchmühle")
                        .font(.headline)
                    Text("Beschreibung: Ein kleiner Ort in der Nähe von Berlin")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.green2))
                .cornerRadius(8)
                .padding()
                
                Spacer() // Damit der Inhalt nicht gequetscht wird
            }
        }
    }
}

#Preview {
    MapView()
}
