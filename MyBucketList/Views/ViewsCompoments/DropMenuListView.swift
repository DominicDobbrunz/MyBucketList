//
//  DropMenuListView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 18.02.25.
//
import Foundation
import SwiftUI

struct DropMenuListView: View {
    @ObservedObject var settingVM: SettingViewModel
    let ListOne: [DataModel] = [
        DataModel(iconName: "gear", title: "Einstellung",
                  destination: AnyView(SettingView())),
        DataModel(iconName: "b.square", title: "Benachrichtigungen", destination: AnyView(NotificationSettingsView())),
        DataModel(iconName: "questionmark.circle", title: "Support", destination: AnyView(SupportView())),
        DataModel(iconName: "shield.lefthalf.filled", title: "Datenschutz", destination: AnyView(DatenschutzView())),
        DataModel(iconName: "info.circle", title: "Information", destination: AnyView(InfoView()))
    ]
    @State var showList = false
    
    var body: some View {
        
        ZStack{
            HStack {
                Image(systemName: "gearshape")
                    .frame(width: 30)
                Text("Einstellungen und Hilfe")
                Spacer()
                Image(systemName: "chevron.forward").font(.system(size: 15))
                    .foregroundStyle(.black)
                    .rotationEffect(.degrees(showList ? 90 : 0))
                    
            }
            .bold()
            .foregroundStyle(.black)
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 53)
            .background(.green1, in: RoundedRectangle(cornerRadius: 10))
            .onTapGesture {
                withAnimation {
                    showList.toggle()
                }
            }
            .zIndex(1)
            
            ForEach(ListOne.indices, id: \.self) {item in
                NavigationLink {
                    ListOne[item].destination
                } label: {
                    HStack{
                        Image(systemName: ListOne[item].iconName).frame(width: 30)
                        Text(ListOne[item].title)
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.green1.opacity(showList ? 1 : (1 - Double(item) * 0.3)), in: RoundedRectangle(cornerRadius: 10))
                }
                .offset(y: showList ? CGFloat(item * 58) : CGFloat(item * 8))
                .scaleEffect(showList ? 1 : (1 - Double(item) * 0.04))
                .zIndex(CGFloat( item * -1))
            }
            .offset(y: showList ? 58 : 0)
        }
        .padding(.horizontal)
    }
}

#Preview {
    DropMenuListView(settingVM: SettingViewModel())
    
}
