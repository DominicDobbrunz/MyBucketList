//
//  BulletPoint.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 24.02.25.
//
import SwiftUI

struct BulletPoint: View {
    var text: String
    var body: some View {
        HStack(alignment: .top) {
            Text("•").bold()
            Text(text)
        }
        .padding(.leading)
    }
}
