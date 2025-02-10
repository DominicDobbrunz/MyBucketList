//
//  UserViewModel.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore

final class UserViewModel: ObservableObject {
    
    private var auth = Auth.auth()
    
    @Published var user: FirebaseAuth.User?
    private let db = Firestore.firestore()
    @Published var fireUser: FireUser?
    @Published var errorMessage: String?
    @Published var isUserGreeted: Bool = false
    
    var isUserSignedIn: Bool {
        user != nil
    }
    var userID: String? {
        user?.uid
    }
    var email: String? {
        user?.email
    }
    var userName: String {
            fireUser?.name ?? "Gast"
        }
    
    
    init() {
            checkIfUserExists()
        }
        
        private func checkIfUserExists() {
            guard let currentUser = auth.currentUser else {
                return
            }
            user = currentUser
        }
    
    func signInAnonymously() async {
        do {
            let result = try await auth.signInAnonymously()
            user = result.user
            errorMessage = nil
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func signUp(email: String, password: String, name: String, birthdate: Date, gender: String, occupation: String) async {
            do {
                let result = try await auth.createUser(withEmail: email, password: password)
                user = result.user

                let newUser = FireUser(
                    id: result.user.uid,
                    email: email,
                    registeredOn: Date(),
                    name: name,
                    birthdate: birthdate,
                    gender: gender,
                    occupation: occupation
                )

                try await db.collection("users").document(result.user.uid).setData([
                    "id": newUser.id,
                    "email": newUser.email,
                    "registeredOn": Timestamp(date: newUser.registeredOn),
                    "name": newUser.name,
                    "birthdate": Timestamp(date: newUser.birthdate),
                    "gender": newUser.gender,
                    "occupation": newUser.occupation
                ])

                errorMessage = nil
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    
    func signIn(email: String, password: String) async {
        do {
            let result = try await auth.signIn(withEmail: email, password: password)
            user = result.user
            errorMessage = nil
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func signOut() {
        do {
            try auth.signOut()
            user = nil
            errorMessage = nil
        } catch {
            errorMessage = error.localizedDescription
        }
    
    }
    func createUser(userID: String, email: String, createdOn: Date) {
        let user = FireUser(id: userID, email: email, registeredOn: createdOn, name: "", birthdate: Date(), gender: "", occupation: "")
        do {
            try FirebaseManager.shared.database.collection("users").document(userID).setData(from: user)
            fetchUser(userID: userID)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchUser(userID: String) {
        Task {
            do {
                let snapshot = try await FirebaseManager.shared.database.collection("users").document(userID).getDocument()
                self.fireUser = try snapshot.data(as: FireUser.self)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
}
