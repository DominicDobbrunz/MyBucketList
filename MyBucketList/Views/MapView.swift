//
//  MapView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI
import MapKit
import Observation

struct MapView: View {
    
    @State private var vm = MapViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Map(position: $vm.cameraPosition) {
                
                Marker("Mein Zuhause", coordinate: .home)
                
                UserAnnotation()
                
                if let currentPlace = vm.currentPlace {
                    Annotation(currentPlace.name ?? "", coordinate: currentPlace.location?.coordinate ?? .home) {
                        Image(systemName: "mappin")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.white)
                            .frame(width: 20, height: 20)
                            .padding(4)
                            .background(.mint, in: .circle)
                            .contextMenu {
                                Button("Get Direction") {
                                    Task {
                                        await vm.calculateRoute(destination: currentPlace.location?.coordinate ?? .home)
                                    }
                                }
                                Button("Look Around Scene") {
                                    Task {
                                        await vm.getLookAroundScene(from: currentPlace.location?.coordinate ?? .home)
                                        guard let _ = vm.lookAroundScene else { return }
                                        vm.isShowingLookAroundScene = true
                                    }
                                }
                            }
                    }
                }
                if let route = vm.route {
                    MapPolyline(route.polyline)
                        .stroke(.mint, lineWidth: 8)
                }
            }
            .mapStyle(.standard)
            .mapControls {
                MapCompass()
                MapUserLocationButton()
                MapPitchToggle()
                MapScaleView()
            }
            .searchable(text: $vm.searchText)
            .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
            .onSubmit(of: .search) {
                vm.getCoordinates(for: vm.searchText)
            }
            .onAppear {
                vm.locationManager.requestWhenInUseAuthorization()
            }
            .lookAroundViewer(isPresented: $vm.isShowingLookAroundScene, initialScene: vm.lookAroundScene)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}



#Preview {
    MapView()
        
}
