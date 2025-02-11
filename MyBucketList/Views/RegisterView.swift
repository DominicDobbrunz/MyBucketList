//
//  RegisterView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var name: String = ""
    @State private var birthdate: Date = Date()
    @State private var gender: String = "Männlich"
    @State private var occupation: String = "Sonnenfreund"

    let genderOptions = ["Männlich", "Weiblich", "Divers"]
    let occupationOptions = ["Sonnenfreund", "Abenteuerfreund", "Stadtfreund", "Landschaftsfreund"]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.red1.ignoresSafeArea()
                VStack(spacing: 20) {
                    Text("Registrieren")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 40)
                    
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    TextField("E-Mail", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(.horizontal)
                    
                    SecureField("Passwort", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    SecureField("Passwort bestätigen", text: $confirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    DatePicker("Geburtsdatum", selection: $birthdate, displayedComponents: .date)
                        .padding(.horizontal)
                    HStack{
                        Text("Geschlecht")
                            .frame(width: 190, alignment: .leading)
                        Picker("Geschlecht", selection: $gender) {
                            ForEach(genderOptions, id: \.self) { Text($0) }
                        }
                        .foregroundStyle(.black)
                        .pickerStyle(MenuPickerStyle())
                        .padding(.horizontal)
                    }
                    HStack{
                        Text("Wer bist du?")
                            .frame(width: 190, alignment: .leading)
                        Picker("Freund", selection: $occupation) {
                            ForEach(occupationOptions, id: \.self) { Text($0) }
                        }
                        .foregroundStyle(.black)
                        .pickerStyle(MenuPickerStyle())
                        .padding(.horizontal)
                    }
                    Button(action: {
                        if password == confirmPassword {
                            Task {
                                await userViewModel.signUp(email: email, password: password, name: name, birthdate: birthdate, gender: gender, occupation: occupation)
                            }
                        } else {
                            userViewModel.errorMessage = "Passwörter stimmen nicht überein."
                        }
                    }) {
                        Text("Registrieren")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green1)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    if let errorMessage = userViewModel.errorMessage {
                        Text("Fehler: \(errorMessage)")
                            .foregroundColor(.black)
                            .font(.footnote)
                            .padding()
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}
