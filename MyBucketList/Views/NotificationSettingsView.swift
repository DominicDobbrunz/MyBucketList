//
//  NotificationSettingsView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 24.02.25.
//


import SwiftUI

struct NotificationSettingsView: View {
    @StateObject private var settingVM = SettingViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var showSingleChatNotifications = true
    @State private var showGroupChatNotifications = true
    @State private var showStatusNotifications = true
    @State private var showReactionNotifications = true
    @State private var showReminders = true
    @State private var resetAlert = false
    @State private var selectedToneSingle = "Aurora"
    @State private var selectedToneGroup = "Bambus"
    let tones = ["Aurora", "Bambus", "Klassisch", "None"]
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text(" Einzelnen Bucket erledigt").foregroundColor(.gray)) {
                        Toggle("Benachrichtigungen anzeigen", isOn: $showSingleChatNotifications)
                        Picker("Ton", selection: $selectedToneSingle) {
                            ForEach(tones, id: \.self) { tone in
                                Text(tone)
                            }
                        }
                        Toggle("Benachrichtigungen bei Reaktionen", isOn: $showReactionNotifications)
                    }
                    
                    
                    Section(header: Text("Vergesse die Bucket List nicht").foregroundColor(.gray)) {
                        Toggle("Benachrichtigungen anzeigen", isOn: $showGroupChatNotifications)
                        Picker("Ton", selection: $selectedToneGroup) {
                            ForEach(tones, id: \.self) { tone in
                                Text(tone)
                            }
                        }
                        Toggle("Benachrichtigungen bei Reaktionen", isOn: $showReactionNotifications)
                    }
                    Section(header: Text("Statusbenachrichtigungen").foregroundColor(.gray)) {
                        Toggle("Benachrichtigungen anzeigen", isOn: $showStatusNotifications)
                        Toggle("Benachrichtigungen bei Reaktionen", isOn: $showReactionNotifications)
                    }
                    Section {
                        Toggle("Erinnerungen", isOn: $showReminders)
                            .padding(.vertical, 5)
                        Text("Erhalte gelegentlich Erinnerung von der Bucket List die noch nicht fertig sind.")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    Section {
                        Button(action: {
                            resetAlert = true
                        }) {
                            Text("Benachrichtigungseinstellungen zurücksetzen")
                                .foregroundColor(.red)
                        }
                        .alert(isPresented: $resetAlert) {
                            Alert(
                                title: Text("Einstellungen zurücksetzen"),
                                message: Text("Alle Benachrichtigungseinstellungen werden zurückgesetzt."),
                                primaryButton: .destructive(Text("Zurücksetzen")) {
                                    resetNotifications()
                                },
                                secondaryButton: .cancel()
                            )
                        }
                    }
                }
                .navigationTitle("Benachrichtigungen")
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
            }
        }
        .scrollContentBackground(.hidden)
        .background(MeshGradientView())
    }
    
    private func resetNotifications() {
        showSingleChatNotifications = true
        showGroupChatNotifications = true
        showStatusNotifications = true
        showReactionNotifications = true
        showReminders = true
        selectedToneSingle = "Aurora"
        selectedToneGroup = "Bambus"
    }
}

#Preview {
    NotificationSettingsView()
}

