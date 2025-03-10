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
    @State private var emailErrorMessage: String = "" 
    @State private var passwordErrorMessage: String = ""

    
    var body: some View {
           NavigationStack {
               VStack(spacing: 20) {
                   VStack {
                       Image("LogIn")
                           .resizable()
                           .frame(width: 350, height: 120)
                           .cornerRadius(8)
                           .shadow(radius: 5)
                           .scaledToFit()
                       
                       Text("Willkommen")
                           .bold().font(Font.custom("Baskerville", size: 30))
                           .bold()
                           .foregroundStyle(.black)
                   }
                   .padding(.top, 40)
                   
                   
                   TextField("E-Mail", text: $email)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .keyboardType(.emailAddress)
                       .autocapitalization(.none)
                       .padding(.horizontal)
                       .onChange(of: email) { oldValue, newValue in
                                               emailErrorMessage = ""
                                           }
                   
                   if !emailErrorMessage.isEmpty {
                       Text(emailErrorMessage)
                           .foregroundColor(.black)
                           .font(.footnote)
                           .padding(.horizontal)
                   }
                   
                   
                   SecureField("Passwort", text: $password)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .padding(.horizontal)
                       .onChange(of: password) { oldValue, newValue in
                                               passwordErrorMessage = ""
                                           }
                   
                   if !passwordErrorMessage.isEmpty {
                       Text(passwordErrorMessage)
                           .foregroundColor(.black)
                           .font(.footnote)
                           .padding(.horizontal)
                   }
                   
                   Button(action: {
                       if validateInput() {
                           Task {
                               await userViewModel.signIn(email: email, password: password)
                           }
                       }
                   }) {
                       Text("Anmelden")
                           .padding()
                           .frame(maxWidth: .infinity)
                           .background(Color.grey1)
                           .foregroundColor(.white)
                           .cornerRadius(8)
                   }
                   .padding(.horizontal)
                
                //  Google Login Button (Platzhalter)
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
                
                //  Apple Login Button (Platzhalter)
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
    // Eingabevalidierung
        private func validateInput() -> Bool {
            if email.isEmpty || !email.contains("@") {
                emailErrorMessage = "Bitte geben Sie eine gültige E-Mail-Adresse ein."
                return false
            }
            
            if password.isEmpty {
                passwordErrorMessage = "Bitte geben Sie Ihr Passwort ein."
                return false
            }
            
            return true
        }
}


//#Preview {
//    LoginView()
//}



