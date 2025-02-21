//
//  SettingView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 20.02.25.
//

import SwiftUI

struct SettingView: View {
    @StateObject private var settingVM = SettingViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                MeshGradientView()
                VStack {
                    Form {
                        Section(header: Text("Einstellung").bold()) {
                            // Dark Mode Toggle
                            Toggle(isOn: $settingVM.isDarkMode) {
                                HStack {
                                    Image(systemName: "moon.fill")
                                        .foregroundColor(.gray)
                                    Text("Nachtmodus")
                                }
                            }
                            
                            // Standortfreigabe Toggle
                            Toggle(isOn: $settingVM.isLocationEnabled) {
                                HStack {
                                    Image(systemName: "location.fill")
                                        .foregroundColor(.gray)
                                    Text("Standortfreigabe")
                                }
                            }
                            
                            // Sprache Picker
                            HStack {
                                Image(systemName: "globe")
                                    .foregroundColor(.gray)
                                Text("Sprache")
                                Spacer()
                                Picker("", selection: $settingVM.selectedLanguage) {
                                    ForEach(settingVM.languages, id: \.self) { language in
                                        Text(language).tag(language)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle()) // Kompakter Picker
                            }
                        }
                    }
                }
                .navigationTitle("Einstellungen")
                .navigationBarBackButtonHidden(true) // Originalen Zurück-Pfeil entfernen
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(.black) // Schwarzer Pfeil
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SettingView()
}
