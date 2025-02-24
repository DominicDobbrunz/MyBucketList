//
//  BulletPointTwo.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 24.02.25.
//

import SwiftUI

struct BulletPointTwo {
    var icon: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.black)
            Text(text)
        }
        .padding(.leading)
    }
}
