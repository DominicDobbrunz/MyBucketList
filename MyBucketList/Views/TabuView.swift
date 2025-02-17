//
//  TabuView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 12.02.25.
//
import Foundation
import SwiftUI

struct TabuView: View {
    @Binding var selectedTab: Tap
    
    var body: some View {
        ZStack{
            MeshGradientView()
            
                HStack{
                    ForEach(tapItems) { item in
                        Button(action: {selectedTab = item.tap}, label: {
                            VStack(spacing: 0){
                                Image(systemName: item.icon)
                                    .symbolVariant(.fill)
                                    .font(.body.bold())
                                    .frame(width: 30, height: 30)
                            }
                            .overlay(
                                VStack{
                                    if selectedTab == item.tap{
                                        Circle()
                                            .frame(width: 8, height: 8)
                                            .foregroundStyle(Color("red1"))
                                            .padding(.top, 39)
                                        
                                    }
                                }
                            )
                            .frame(maxWidth: .infinity)
                        })
                        .foregroundStyle(selectedTab == item.tap ? Color("red1"): .secondary)
                    }
                }
                .frame(width: 350, height: 70)
                .background(
                    TabBackground()
                )
                
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: .black.opacity(0.2), radius: 10, x: 10, y: 10)
            }
        
    }
}
