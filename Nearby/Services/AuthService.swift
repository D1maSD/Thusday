//
//  AuthService.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 10.09.2022.
//

import Foundation
import Firebase
import FirebaseAuth
import UIKit


class AuthService {
    
    let auth = Auth.auth()
    static let shared = AuthService()
    
    func signUpUser(email: String?, password: String?, confirmPassword: String?, completion: @escaping (Result<User, Error>) -> ()) {
        
        let isEmpty = Validators.isEmpty(password: password, email: email, confirmPassword: confirmPassword)
        
        guard isEmpty != false else {
            completion(.failure(Errors.emptyEmailOrPassword))
            return
        }
        
        
        
        auth.createUser(withEmail: email!, password: password!) { result, error in
            guard let result = result else {
                return completion(.failure(error!))
            }
            completion(.success(result.user))
        }
    }
    
    func loginUser(email: String?, password: String?, completion: @escaping (Result<User, Error>) -> ()) {
        
        auth.signIn(withEmail: email!, password: password!) { result, error in
            guard let result = result else {
                return completion(.failure(error!))
            }
            completion(.success(result.user))
        }
    }
}
