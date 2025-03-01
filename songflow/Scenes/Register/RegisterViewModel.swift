//
//  RegisterViewModel.swift
//  songflow
//
//  Created by Burak Özdemir on 1.03.2025.
//

import Foundation

class RegisterViewModel {
    private let service: AuthServiceProtocol
    
    init(service: AuthService = .init()) {
        self.service = service
    }
    
    func register(with email: String, and password: String, completion: @escaping (Error?) -> Void) {
        service.signUp(with: email, and: password) { authError in
            if let authError = authError {
                completion(authError)
            } else {
                completion(nil)
            }
        }
    }
}
