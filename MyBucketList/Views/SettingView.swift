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
    @State private var brightness: Double = UIScreen.main.brightness
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Einstellung").bold().foregroundColor(.black)) {
                        Toggle(isOn: $settingVM.isDarkMode) {
                            HStack {
                                Image(systemName: "moon.fill")
                                    .foregroundColor(.gray)
                                Text("Nachtmodus")
                            }
                        }
                        Toggle(isOn: $settingVM.isLocationEnabled) {
                            HStack {
                                Image(systemName: "location.fill")
                                    .foregroundColor(.gray)
                                Text("Standortfreigabe")
                            }
                        }
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
                            .pickerStyle(MenuPickerStyle())
                        }
                        VStack(alignment: .leading) {
                                            Text("Helligkeit")
                                                .font(.headline)
                                                .foregroundColor(.white)
                                            
                                            Slider(value: $brightness, in: 0...1, step: 0.01) { _ in
                                                UIScreen.main.brightness = CGFloat(brightness) // Bildschirmhelligkeit setzen
                                            }
                                            .accentColor(.yellow)
                                        }
                                        .padding(.horizontal)
                                        
                                        Spacer()
                    }
                }
            }
            .navigationTitle("Einstellungen")
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
    SettingView()
}
