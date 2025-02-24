//
//  MapView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var viewModel: MapViewModel
    
    var body: some View {
        ZStack {
            VStack {
            // 📍 Map mit Bindung zur Region
            Map(coordinateRegion: $viewModel.region,
                showsUserLocation: true,
                annotationItems: viewModel.pointsOfInterest) { place in
                MapAnnotation(coordinate: place.coordinate) {
                    Button(action: {
                        viewModel.selectedPlace = place
                    }) {
                        VStack {
                            Image(systemName: "mappin.circle.fill")
                                .foregroundColor(.red)
                                .font(.title)
                            Text(place.title)
                                .font(.caption)
                                .bold()
                        }
                    }
                }
            }
            .frame(height: viewModel.isFullScreen ? UIScreen.main.bounds.height : UIScreen.main.bounds.height / 2)
            .edgesIgnoringSafeArea(viewModel.isFullScreen ? .all : .top)
            
            // ❌ X-Button zum Verkleinern der Karte
            if viewModel.isFullScreen {
                Button(action: {
                    viewModel.toggleFullScreen()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .padding()
                }
            }
            
            // 📌 Sehenswürdigkeits-Info unten
            if let place = viewModel.selectedPlace {
                VStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        Text(place.title)
                            .font(.title2)
                            .bold()
                        
                        Text(place.subtitle ?? "Keine Beschreibung verfügbar")
                            .font(.body)
                            .foregroundColor(.secondary)
                        
                        Button(action: {
                            openInMaps(coordinate: place.coordinate)
                        }) {
                            Label("Navigation starten", systemImage: "arrow.triangle.turn.up.right.circle.fill")
                                .foregroundColor(.blue)
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .padding()
                }
            }
            
            // 🔍 Toggle für Vollbildmodus
                VStack {
                    Spacer()
                    Button(action: {
                        viewModel.toggleFullScreen()
                    }) {
                        Text(viewModel.isFullScreen ? "Karte verkleinern" : "Karte vergrößern")
                            .padding()
                            .background(.green1)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .background(MeshGradientView())
        }
    }
    
    func openInMaps(coordinate: CLLocationCoordinate2D) {
        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Zielort"
        mapItem.openInMaps()
    }
}



#Preview {
    MapView()
        .environmentObject(MapViewModel())
}
