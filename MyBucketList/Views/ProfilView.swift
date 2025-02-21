//
//  ProfilView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI
import Firebase
struct ProfilView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject private var settingVM = SettingViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ZStack{
                MeshGradientView()
                VStack(spacing: 20) {
                    
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                    
                    if settingVM.isEditing {
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
                        
                        
                        HStack {
                            Text("Wie alt bist du:")
                                .padding(.horizontal,18)
                            Spacer()
                            DatePicker("Geburtstag", selection: $settingVM.birthdate, displayedComponents: .date)
                                .labelsHidden()
                                .datePickerStyle(CompactDatePickerStyle())
                                .padding(.horizontal)
                        }
                        
                        Button("Speichern") {
                            settingVM.saveUserData()
                            settingVM.isEditing = false
                        }
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green1)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .padding(.horizontal)
                        
                    } else {
                        VStack {
                            Text(settingVM.name)
                                .font(.title2)
                                .bold()
                                .padding(.bottom, 10)
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Geschlecht:")
                                    Text("Wer bist du?")
                                    Text("Geburtstag:")
                                }
                                .foregroundColor(.black)
                                
                                Spacer()
                                
                                VStack(alignment: .trailing, spacing: 10) {
                                    Text(settingVM.gender)
                                    Text(settingVM.occupation)
                                    Text("\(settingVM.birthdate, formatter: dateFormatter)")
                                }
                                .foregroundColor(.black)
                            }
                            .padding(.horizontal, 40)
                        }
                        .padding()
                    }
                    DropMenuListView(settingVM: settingVM)
                        .padding(.bottom,280)
                    
                    Button(action: {
                                        settingVM.logout()
                                        presentationMode.wrappedValue.dismiss()
                                    }) {
                                        HStack {
                                            Text("Ausloggen")
                                                .bold()
                                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.green1)
                                        .foregroundColor(.black)
                                        .cornerRadius(8)
                                    }
                                    .padding(.horizontal)
                                    .padding(.bottom, 40)
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

