//
//  UserViewModel.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.02.25.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore

@MainActor
final class UserViewModel: ObservableObject {
    @Published var user: FirebaseAuth.User?
    private let db = Firestore.firestore()
    @Published var fireUser: FireUser?
    @Published var errorMessage: String?

    var isUserSignedIn: Bool {
        user != nil
    }
    var userID: String? {
            user?.uid
        }
    
    init() {
        checkIfUserExists()
    }

    private func checkIfUserExists() {
        guard let currentUser = Auth.auth().currentUser else { return }
        user = currentUser
        fetchUser(userID: currentUser.uid)
    }

    func signUp(email: String, password: String, name: String) async {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            user = result.user

            let newUser = FireUser(
                id: result.user.uid,
                email: email,
                registeredOn: Date(),
                name: name
            )

            try await db.collection("users").document(result.user.uid).setData([
                "id": newUser.id,
                "email": newUser.email,
                "registeredOn": Timestamp(date: newUser.registeredOn),
                "name": newUser.name,
            ])

            errorMessage = nil
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func signIn(email: String, password: String) async {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            user = result.user
            errorMessage = nil
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            user = nil
            errorMessage = nil
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func fetchUser(userID: String) {
        Task {
            do {
                let snapshot = try await db.collection("users").document(userID).getDocument()
                self.fireUser = try snapshot.data(as: FireUser.self)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
