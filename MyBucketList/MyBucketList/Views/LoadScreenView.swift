//
//  LoadScreenView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI

struct LoadScreenView: View {
    var body: some View {
        LoadView(title: "My Bucket List", image: .background1, content: LoginView())
    }
}

#Preview {
    LoadScreenView()
}
