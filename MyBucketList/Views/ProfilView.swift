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
    
    private var minimumDate: Date {
            let calendar = Calendar.current
            let currentDate = Date()
            return calendar.date(byAdding: .year, value: -16, to: currentDate) ?? currentDate
        }
    
    var body: some View {
        NavigationStack {
            ZStack{
                MeshGradientView()
                VStack(spacing: 20) {
                    if let image = settingVM.selectedOccupation?.getImage() {
                        Image(image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .padding(.top, 20)
                    }
                    
                    
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
                            Picker("", selection: $settingVM.selectedOccupation) {
                                ForEach(Occupation.allCases, id: \.self) { option in
                                    Text(option.rawValue).tag(option)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        .padding(.horizontal)
                        
                        
                        HStack {
                            Text("Wie alt bist du:")
                                .foregroundColor(.black)
                                .padding(.horizontal,18)
                            Spacer()
                            DatePicker("Geburtstag", selection: $settingVM.birthdate, in: ...minimumDate, displayedComponents: .date)
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
                        .background(Color.grey1)
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
                                    Text(settingVM.selectedOccupation?.rawValue ?? "Sonnenfreund")
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
                                        userViewModel.signOut()
                                        presentationMode.wrappedValue.dismiss()
                                    }) {
                                        HStack {
                                            Text("Ausloggen")
                                                .bold()
                                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.grey1)
                                        .foregroundColor(.black)
                                        .cornerRadius(8)
                                    }
                                    .padding(.horizontal)
                                    .padding(.bottom, 45)
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

