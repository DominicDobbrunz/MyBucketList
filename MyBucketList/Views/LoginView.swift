//
//  LoginView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showRegisterView = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.red1.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("My Bucket List")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom,80)
                    TextField("E-Mail", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(.horizontal)
                    
                    SecureField("Passwort", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Button(action: {
                        Task {
                            await userViewModel.signIn(email: email, password: password)
                        }
                    }) {
                        Text("Anmelden")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green1)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    if let errorMessage = userViewModel.errorMessage {
                        Text("Fehler: \(errorMessage)")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .padding()
                    }
                    Button(action: {
                        Task {
                            await userViewModel.signInAnonymously()
                        }
                    }) {
                        Text("Anonym anmelden")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green1)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    NavigationLink(destination: RegisterView()) {
                        Text("Noch keinen Account? Jetzt registrieren")
                            .font(.footnote)
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                
                .padding()
            }
        }
    }
}


#Preview {
    LoginView()
}



