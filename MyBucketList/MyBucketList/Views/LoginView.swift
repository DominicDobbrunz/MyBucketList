//
//  LoginView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack{
            Color.red1.ignoresSafeArea()
            Text ("Login").bold()
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    LoginView()
}

