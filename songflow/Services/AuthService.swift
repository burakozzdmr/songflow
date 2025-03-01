//
//  AuthService.swift
//  songflow
//
//  Created by Burak Özdemir on 1.03.2025.
//

import Foundation
import FirebaseAuth

protocol AuthServiceProtocol {
    func signIn(with email: String, and password: String, completion: @escaping (Error?) -> Void)
    func signUp(with email: String, and password: String, completion: @escaping (Error?) -> Void)
    func logOut()
}

class AuthService {}

extension AuthService: AuthServiceProtocol {
    func signIn(with email: String, and password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            if let authError = error {
                completion(authError)
            } else {
                completion(nil)
            }
        }
    }
    
    func signUp(with email: String, and password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if let authError = error {
                completion(authError)
            } else {
                completion(nil)
            }
        }
        
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
            print("Logout process is successfully !")
        } catch {
            print("Logout process is failed, error message: \(error.localizedDescription)")
        }
    }
}
