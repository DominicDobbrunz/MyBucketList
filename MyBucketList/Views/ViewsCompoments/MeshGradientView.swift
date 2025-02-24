//
//  MeshGradientView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 17.02.25.
//

import SwiftUI

struct MeshGradientView: View {

    @State private var gradientStart = UnitPoint(x: 0, y: 0)
    @State private var gradientEnd = UnitPoint(x: 1, y: 0.5)
    
    var opacity: Double = 1
    
    // Bi-Color Gradient
    let colors: [Color] = [ .red2, .red1]
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: gradientStart, endPoint: gradientEnd)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                // Animation für den Startpunkt
                withAnimation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
                    self.gradientStart = UnitPoint(x: 1, y: 0)
                }
                
                // Animation für den Endpunkt (leicht verzögert)
                withAnimation(Animation.easeInOut(duration: 5).delay(2.5).repeatForever(autoreverses: true)) {
                    self.gradientEnd = UnitPoint(x: 0, y: 1)
                }
            }
            .opacity(self.opacity)
    }
}


#Preview {
    MeshGradientView()
}
