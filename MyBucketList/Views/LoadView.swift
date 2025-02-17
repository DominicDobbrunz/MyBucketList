//
//  LoadView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI

struct LoadView<Content:View>: View {
    @State private var show = false
    @State private var showLoginView = false
    var title: String
    var image: ImageResource
    var content: Content
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing:0) {
                ZStack{
                    Text(title).bold().font(Font.custom("Baskerville", size: 45))
                        .foregroundStyle(.white)
                    
                        .opacity(show ? 1 : 0)
                        .offset(y: -100)
                        .offset(y: show ? 0 : -50)
                        .scaleEffect(show ? 1 : 2.5)
                    
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .background(
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .scaleEffect(show ? 2 : 3.5)
                        .animation(.easeInOut(duration: 2), value: show)
                )
                content
                    .frame(width: geo.size.width, height: geo.size.height)
                    .offset(y: showLoginView ? -geo.size.height : 0)
                    .animation(.linear(duration: 2), value: showLoginView)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            show = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showLoginView = true
            }
        }
    }
}

