//
//  TabBackground.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 13.02.25.
//
import SwiftUI

struct TabBackground: View {
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color("grey1"), .grey2]), startPoint: .top, endPoint: .bottomTrailing)
                )
                .blur(radius: 10)
                .offset(x: -10, y: -10)
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color("grey1"), .grey2]), startPoint: .top, endPoint: .bottom)
                )
                .padding(2)
                .blur(radius: 1)
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(lineWidth: 0.1)
                .blur(radius: 1)
        }
    }
}

            
