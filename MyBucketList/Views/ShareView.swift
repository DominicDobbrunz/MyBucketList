//
//  ShareView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 18.03.25.
//


import SwiftUI

struct ShareView: View {
    var items: [Any] // Die Inhalte, die geteilt werden sollen
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Text("Teilen über")
                .font(.headline)
                .foregroundColor(.black)
                .padding(.top, 20)

            // 🔹 Buttons für verschiedene Plattformen
            Button(action: {
                shareOnPlatform("Instagram")
            }) {
                HStack {
                    Image(systemName: "camera.fill")
                    Text("Instagram")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.grey1)
                .foregroundColor(.black)
                .cornerRadius(10)
            }

            Button(action: {
                shareOnPlatform("Facebook")
            }) {
                HStack {
                    Image(systemName: "f.circle.fill")
                    Text("Facebook")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.grey1)
                .foregroundColor(.black)
                .cornerRadius(10)
            }

            Button(action: {
                shareOnPlatform("iMessage")
            }) {
                HStack {
                    Image(systemName: "message.fill")
                    Text("iMessage")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.grey1)
                .foregroundColor(.black)
                .cornerRadius(10)
            }

            Button(action: {
                shareOnPlatform("WhatsApp")
            }) {
                HStack {
                    Image(systemName: "phone.fill")
                    Text("WhatsApp")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.grey1)
                .foregroundColor(.black)
                .cornerRadius(10)
            }

            Spacer()
        }
        .padding(.horizontal, 20)
    }

    // 🔹 Funktion zum Teilen über eine bestimmte Plattform
    private func shareOnPlatform(_ platform: String) {
            print("Teilen über \(platform)")
            presentationMode.wrappedValue.dismiss() // Schließe die ShareView

            // 🔹 Verwende UIWindowScene.windows, um den ShareSheet anzuzeigen
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootViewController = windowScene.windows.first?.rootViewController {
                let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
                rootViewController.present(activityViewController, animated: true, completion: nil)
            }
        }
}
