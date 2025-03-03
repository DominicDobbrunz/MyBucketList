//
//  CompanionPicker.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 03.03.25.
//
import SwiftUI

struct CompanionPicker: View {
    @Binding var selection: Companion
    
    var body: some View {
        HStack {
            Text("Mit wem?")
                .font(.headline)
                .foregroundColor(.black)
                .padding(.horizontal)
            
            Spacer()
            
            Picker("Mit wem?", selection: $selection) {
                ForEach(Companion.allCases) { option in
                    Text(option.rawValue).tag(option)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .background(Color.grey1.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }
}
