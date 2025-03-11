//
//  RegisterView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showPassword: Bool = false
    @State private var showConfirmPassword: Bool = false
    @State private var errorMessage: String = "" 

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                VStack {
                    Image("RegestrierEN")
                        .resizable()
                        .frame(width: 350, height: 120)
                        .shadow(radius: 5)
                        .cornerRadius(8)
                        .scaledToFit()
                    
                    Text("Registrieren")
                        .bold().font(Font.custom("Baskerville", size: 30))
                }
                .padding(.top, 40)
                
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.words)
                    .padding(.horizontal)

                TextField("E-Mail", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding(.horizontal)

                HStack {
                    if showPassword {
                        TextField("Passwort", text: $password)
                    } else {
                        SecureField("Passwort", text: $password)
                    }
                    Button(action: {
                        showPassword.toggle()
                    }) {
                        Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.black)
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

                HStack {
                    if showConfirmPassword {
                        TextField("Passwort wiederholen", text: $confirmPassword)
                    } else {
                        SecureField("Passwort wiederholen", text: $confirmPassword)
                    }
                    Button(action: {
                        showConfirmPassword.toggle()
                    }) {
                        Image(systemName: showConfirmPassword ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.black)
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.black)
                        .font(.footnote)
                        .padding(.horizontal)
                }

                Button(action: {
                    if validatePassword() {
                        Task {
                            guard password == confirmPassword else {
                                errorMessage = "Passwörter stimmen nicht überein."
                                return
                            }
                            await userViewModel.signUp(email: email, password: password, name: name)
                        }
                    }
                }) {
                    Text("Auf zum Bucket")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.grey1)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)

                Spacer()
            }
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
            .navigationBarBackButtonHidden(true)
            .padding()
            .background(MeshGradientView().ignoresSafeArea())
        }
    }

    // Passwortvalidierung
    private func validatePassword() -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        
        if passwordTest.evaluate(with: password) {
            errorMessage = ""
            return true
        } else {
            errorMessage = "Passwort muss mindestens 8 Zeichen, eine Zahl und ein Sonderzeichen enthalten."
            return false
        }
    }
}

#Preview {
    RegisterView()
        .environmentObject(UserViewModel())
}

