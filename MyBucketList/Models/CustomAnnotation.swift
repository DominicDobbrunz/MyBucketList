//
//  CustomAnnotation.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 24.02.25.
//


import MapKit

struct CustomAnnotation: Identifiable {
    let id = UUID() // Eindeutige ID für jede Annotation
    let title: String
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
}
