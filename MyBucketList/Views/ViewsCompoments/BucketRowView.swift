//
//  BucketRowView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 26.02.25.
//
import SwiftUI

struct BucketRowView: View {
    var bucket: BucketListItem

    var body: some View {
        HStack {
            Text(bucket.title)
            Spacer()
            Image(systemName: bucket.completed ? "checkmark.circle.fill" : "circle")
                .foregroundColor(bucket.completed ? .green1 : .gray)
        }
    }
}
