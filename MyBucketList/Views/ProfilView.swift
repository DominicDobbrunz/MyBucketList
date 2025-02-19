//
//  ProfilView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI
import Firebase
struct ProfilView: View {
    
    @StateObject private var settingVM = SettingViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack{
                MeshGradientView()
                VStack(spacing: 20) {
                    // Profilbild
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                    
                    if settingVM.isEditing {
                        // Bearbeitungsmodus: Textfelder & Picker
                        TextField("Name", text: $settingVM.name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        
                        HStack {
                            Text("Geschlecht:")
                                .foregroundColor(.black)
                            Spacer()
                            Picker("", selection: $settingVM.gender) {
                                ForEach(settingVM.genderOptions, id: \.self) { option in
                                    Text(option)
                                        .foregroundStyle(.black)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Wer bist du:")
                                .foregroundColor(.black)
                                
                            Spacer()
                            Picker("", selection: $settingVM.occupation) {
                                ForEach(settingVM.occupationOptions, id: \.self) { option in
                                    Text(option)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        .padding(.horizontal)
                        
                        // Kompakter DatePicker
                        HStack {
                            Text("Wie alt bist du:")
                                .padding(.horizontal,18)
                            Spacer()
                            DatePicker("Geburtstag", selection: $settingVM.birthdate, displayedComponents: .date)
                                .labelsHidden()
                                .datePickerStyle(CompactDatePickerStyle())
                                .padding(.horizontal)
                        }
                        // Speichern-Button
                        Button("Speichern") {
                            settingVM.saveUserData()
                            settingVM.isEditing = false
                        }
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green1)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        
                    } else {
                        // Anzeigemodus: Labels mit gespeicherten Daten
                        VStack(spacing: 8) {
                            Text(settingVM.name).font(.title2).bold()
                            Text("Geschlecht: \(settingVM.gender)")
                            Text("Wer bist du? \(settingVM.occupation)")
                            Text("Geburtstag: \(settingVM.birthdate, formatter: dateFormatter)")
                        }
                        
                        Spacer()
                    }
                    DropMenuListView(settingVM: settingVM)
                        .padding(.bottom,310)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(settingVM.isEditing ? "Abbrechen" : "Bearbeiten") {
                            settingVM.isEditing.toggle()
                        }
                        .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

// Format für das Datum
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()




#Preview {
    ProfilView()
        .environmentObject(SettingViewModel())
        .environmentObject(UserViewModel())
}

