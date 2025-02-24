//
//  ControlButton.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 24.02.25.
//
import SwiftUI
import MapKit

struct ControlButton: View {
    var icon: String
    
    var body: some View {
        Image(systemName: icon)
            .font(.title2)
            .frame(width: 50, height: 50)
            .background(Color.white.opacity(0.9))
            .clipShape(Circle())
            .shadow(radius: 5)
    }
}
