//
//  MapViewModel.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 13.02.25.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore
import Foundation
import SwiftUI
import MapKit

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.137154, longitude: 11.576124), // München als Standardort
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @Published var locationManager = CLLocationManager()
    @Published var userLocation: CLLocationCoordinate2D?
    @Published var pointsOfInterest: [CustomAnnotation] = []
    @Published var selectedPlace: CustomAnnotation? = nil
    @Published var isFullScreen: Bool = false
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // Beispiel-Sehenswürdigkeiten hinzufügen
        addCustomPlace(title: "Eiffelturm", description: "Berühmter Turm in Paris", coordinate: CLLocationCoordinate2D(latitude: 48.858844, longitude: 2.294351))
        addCustomPlace(title: "Brandenburger Tor", description: "Historisches Denkmal in Berlin", coordinate: CLLocationCoordinate2D(latitude: 52.516274, longitude: 13.377704))
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            DispatchQueue.main.async {
                self.userLocation = location.coordinate
                self.region.center = location.coordinate
            }
        }
    }
    
    func addCustomPlace(title: String, description: String, coordinate: CLLocationCoordinate2D) {
        let newPlace = CustomAnnotation(title: title, subtitle: description, coordinate: coordinate)
        DispatchQueue.main.async {
            self.pointsOfInterest.append(newPlace)
        }
    }
    
    func toggleFullScreen() {
        withAnimation {
            isFullScreen.toggle()
        }
    }
}

