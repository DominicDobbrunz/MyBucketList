//
//  InfoView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 24.02.25.
//


import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
               VStack(alignment: .leading, spacing: 16) {
                    
                    
                    Image("IconBL")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .cornerRadius(5)
                        .padding(.top, 20)
                        .frame(maxWidth: .infinity)
                    
                    
                    Text("🌍 MyBucketList – Die Reise-App")
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    
                    Text("Mit **MyBucketList** kannst du deine Traumreisen planen, Reiseziele speichern und deine Erlebnisse mit Freunden teilen. Egal ob Städte, Strände oder Berge – hier kannst du all deine Reisewünsche verwalten.")
                        .font(.body)
                        .foregroundColor(.primary)
                    
                    Divider()
                    
                    // Funktionen der App
                    Text("✨ Funktionen:")
                        .font(.headline)
                    
                    BulletPointTwo(icon: "mappin.circle", text: "Speichere deine Lieblingsreiseziele")
                    BulletPointTwo(icon: "checkmark.seal.fill", text: "Setze dir Reiseziele und erreiche sie")
                    BulletPointTwo(icon: "square.and.pencil", text: "Halte deine Erlebnisse in Reisetagebüchern fest")
                    BulletPointTwo(icon: "network", text: "Teile deine Reisen mit Freunden")
                    
                    Divider()
                    
                    // App-Infos
                    Text("📌 Über diese App")
                        .font(.headline)
                    
                    InfoRow(title: "App-Version:", value: "1.0.0")
                    InfoRow(title: "Entwickler:", value: "D. D. ")
                    InfoRow(title: "Support E-Mail:", value: "support@mybucketlist.com")
                    InfoRow(title: "Website:", value: "www.mybucketlist.com")
                    
                    Divider()
                    
                    // Danksagung
                    Text("🙏 Danke, dass du MyBucketList nutzt! Wir wünschen dir viele tolle Reisen und Erlebnisse!")
                        .multilineTextAlignment(.center)
                        .font(.callout)
                        .foregroundColor(.primary)
                        .padding()
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Info")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
            }
            .background(MeshGradientView())
        }
    }
}

#Preview {
    InfoView()
}
