//
//  TileView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 17.02.25.
//

import SwiftUI
import Firebase

struct TileView: View {
    var bucketItem: BucketListItem
    
    var body: some View {
        ZStack {
            MeshGradientView()
            VStack {
                ZStack(alignment: .topLeading) {
                    Image("Schatten")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width - 20, height: 250)
                        .blur(radius: 40)
                        .cornerRadius(14)
                        .opacity(0.7)
                        .shadow(radius: 12)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(bucketItem.country)
                            .font(.footnote)
                            .foregroundColor(.black.opacity(0.7))
                        
                        Text(bucketItem.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Label(bucketItem.companion.rawValue, systemImage: "person.2.fill")
                            .font(.footnote)
                            .foregroundColor(.black.opacity(0.8))
                    }
                    .padding(16)
                    HStack {
                        Spacer()
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                            .foregroundColor(.black.opacity(0.8))
                            .padding()
                    }
                }
                .overlay {
                    Image("Regestrieren")
                        .resizable()
                        .frame(width: 350, height: 130)
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 10)
                        .padding(.top, 88)
                }
            }
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    TileView(bucketItem: BucketListItem(title: "Abenteuer", country: "Australien", companion: .partner))
}





