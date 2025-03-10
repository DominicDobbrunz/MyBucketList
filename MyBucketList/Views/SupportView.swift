//
//  SupportView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 24.02.25.
//


import SwiftUI

struct SupportView: View {
    @StateObject private var settingVM = SettingViewModel()
    @Environment(\.dismiss) var dismiss
    let phoneNumber = "1234567890"
    let email = "support@mybucketlist.com"
    let helpURL = URL(string: "https://www.mybucketlist-hilfe.com")!
    
    var body: some View {
        NavigationStack {
            Form {
               
                Section(header: Text("Kontakt").font(.headline)) {
                    HStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(.green)
                        Text("Telefon: \(phoneNumber)")
                        Spacer()
                        Link(destination: URL(string: "tel://\(phoneNumber)")!) {
                            Image(systemName: "arrow.up.right.square")
                        }
                    }
                }
                
                Section {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.blue)
                        Text("E-Mail: \(email)")
                        Spacer()
                        Link(destination: URL(string: "mailto:\(email)")!) {
                            Image(systemName: "arrow.up.right.square")
                        }
                    }
                }
                
                Section {
                    HStack {
                        Image(systemName: "questionmark.circle.fill")
                            .foregroundColor(.orange)
                        Text("Hilfeseite besuchen")
                        Spacer()
                        Link(destination: helpURL) {
                            Image(systemName: "arrow.up.right.square")
                        }
                    }
                }
                
                Section(header: Text("App-Version").font(.headline)) {
                    Text("Version: 1.0.0")
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Support")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(MeshGradientView())
        }
    }
}

#Preview {
    SupportView()
}
