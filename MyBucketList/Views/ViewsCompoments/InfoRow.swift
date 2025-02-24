//
//  InfoRow.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 24.02.25.
//
import SwiftUI

struct InfoRow: View {
    var title: String
    var value: String
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value).bold()
        }
    }
}
