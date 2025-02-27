//
//  LoginView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showRegisterView = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                VStack {
                    Image("Login")
                        .resizable()
                        .frame(width: 373, height: 120)
                        .cornerRadius(8)
                        .scaledToFit()
                    
                    
                    
                    Text("Willkommen").bold().font(Font.custom("Baskerville", size: 30))
                        .bold()
                        .foregroundStyle(.black)
                }
                .padding(.top, 40)
                
                
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
                    //userViewModel.isUserSignedIn = true
                    
                }) {
                    Text("Anmelden")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.grey1)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                // 🔵 Google Login Button (Platzhalter)
                Button(action: {
                    print("Google Login gedrückt")
                }) {
                    HStack {
                        Image(systemName: "globe")
                        
                        // Google-Icon (ersetzbar)
                        Text("Google")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.grey1)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
                }
                .padding(.horizontal)
                
                // 🍏 Apple Login Button (Platzhalter)
                Button(action: {
                    print("Apple Login gedrückt")
                }) {
                    HStack {
                        Image(systemName: "applelogo")
                        Text("Apple")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.grey1)
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
            .background(MeshGradientView().ignoresSafeArea())
        }
        }
}


//#Preview {
//    LoginView()
//}



