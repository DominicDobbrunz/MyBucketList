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

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                VStack {
                    Image("Regestrieren")
                        .resizable()
                        .frame(width: 373, height: 120)
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
                        Rectangle()
                            .frame(width: 32, height: 32)
                            .cornerRadius(5)
                            .foregroundColor(.green1)
                            .overlay(
                                Text(showPassword ? "🔓" : "🔒")
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                            )
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
                                       Rectangle()
                                           .frame(width: 32, height: 32)
                                           .cornerRadius(5)
                                           .foregroundColor(.green1)
                                           .overlay(
                                               Text(showConfirmPassword ? "🔓" : "🔒")
                                                   .font(.system(size: 14))
                                                   .foregroundColor(.black)
                                           )
                                   }
                               }
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .padding(.horizontal)

                if let errorMessage = userViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.black)
                        .font(.footnote)
                        .padding(.horizontal)
                }

                Button(action: {
                    Task {
                        guard password == confirmPassword else {
                            userViewModel.errorMessage = "Passwörter stimmen nicht überein."
                            return
                        }
                        await userViewModel.signUp(email: email, password: password, name: name)
                    }
                }) {
                    Text("Auf zum Bucket")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green1)
                        .foregroundColor(.black)
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
            .padding()
            .background(MeshGradientView().ignoresSafeArea())
        }
    }
}

#Preview {
    RegisterView()
        .environmentObject(UserViewModel())
}

