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

            
            Button(action: {
                shareOnPlatform("Instagram")
            }) {
                HStack {
                    Image("Insta")
                        .resizable()
                        .frame(width: 20, height: 20)
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
                    Image("Facebook")
                        .resizable()
                        .frame(width: 20, height: 20)
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
                        .resizable()
                        .frame(width: 20, height: 20)
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
                    Image("WhatsApp")
                        .resizable()
                        .frame(width: 20, height: 20)
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
    private func shareOnPlatform(_ platform: String) {
            print("Teilen über \(platform)")
            presentationMode.wrappedValue.dismiss()
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootViewController = windowScene.windows.first?.rootViewController {
                let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
                rootViewController.present(activityViewController, animated: true, completion: nil)
            }
        }
}
