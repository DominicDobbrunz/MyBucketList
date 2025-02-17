//
//  ProfilView.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import SwiftUI

struct ProfilView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        ZStack {
            MeshGradientView()
            if userViewModel.isUserSignedIn {
                VStack {
                    Text("Profil")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Button(action: {
                        userViewModel.signOut()
                    }) {
                        Text("Abmelden")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green1)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            } else {
                LoginView()
            }
        }
    }
}


//#Preview {
//    ProfilView()
//        .environmentObject(UserViewModel())
//}

