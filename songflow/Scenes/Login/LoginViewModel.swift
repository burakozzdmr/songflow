//
//  LoginViewModel.swift
//  songflow
//
//  Created by Burak Özdemir on 1.03.2025.
//

import Foundation

class LoginViewModel {
    private let service: AuthServiceProtocol
    
    init(service: AuthService = .init()) {
        self.service = service
    }
    
    func login(with email: String, and password: String, completion: @escaping (Error?) -> Void) {
        service.signIn(with: email, and: password) { authError in
            if let authError = authError {
                completion(authError)
            } else {
                completion(nil)
            }
        }
    }
}
