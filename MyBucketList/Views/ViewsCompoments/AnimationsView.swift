//
//  AnimationsView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 07.03.25.
//

import SwiftUI

struct AnimationsView: View {
    @State private var isShowingList = false
       let bucketListItems = ["Eiffelturm besuchen", "Strände in Bali genießen", "Safari in Afrika", "Nordlichter sehen", "Grand Canyon erkunden"]

       var body: some View {
           VStack {
               Button(action: {
                   withAnimation {
                       isShowingList.toggle()
                   }
               }) {
                   Text(isShowingList ? "Inspiration gefunden" : "Hier ein paar Ideen")
                       .padding()
                       .background(Color.grey1)
                       .foregroundColor(.black)
                       .cornerRadius(10)
               }

               if isShowingList {
                   List(bucketListItems, id: \.self) { item in
                       Text(item)
                   }
                   .listStyle(.plain)
                   .transition(.opacity)
               }
           }
           .padding()
           
       }
}

#Preview {
    AnimationsView()
}
