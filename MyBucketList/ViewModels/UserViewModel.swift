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
    private let db = FirebaseManager.shared.database
    @Published var fireUser: FireUser?
    @Published var errorMessage: String?
    @Published var isUserGreeted: Bool = false
    //ToDo: DeBug zwecken handish gesetzt
//    var isUserSignedIn: Bool {
//        user != nil
//    }
    @Published var isUserSignedIn: Bool = false
    
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
        guard let currentUser = auth.currentUser else { return }
        user = currentUser
        fetchUser(userID: currentUser.uid)
    }

    func signUp(email: String, password: String, name: String) async {
            do {
                let result = try await auth.createUser(withEmail: email, password: password)
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
        let user = FireUser(id: userID, email: email, registeredOn: createdOn, name: "")
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
