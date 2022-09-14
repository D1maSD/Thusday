//
//  Validators.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 11.09.2022.
//

import Foundation
import RxSwift

class Validators {
    
    static func isEmpty(password: String?, email: String?, confirmPassword: String?) -> Bool {
        guard password != "", email != "", confirmPassword != "" else {
            return false
        }
        return true
    }
    //
    static func isValidEmail(email: String) -> Bool {
        let emailRegEx = "^(?!\\.)([A-Z0-9a-z_%+-]?[\\.]?[A-Z0-9a-z_%+-])+@[A-Za-z0-9-]{1,20}(\\.[A-Za-z0-9]{1,15}){0,10}\\.[A-Za-z]{2,20}$"
        return check(text: email, regEx: emailRegEx)
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        let emailPred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return emailPred.evaluate(with: text)
    }
    //
    
    static func isValidPassword(password: String?) -> Bool {
        
        guard password != "" else {
            return false
        }
        let password = password!.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)
    }
}

enum Errors {
    case emptyEmailOrPassword
    case passwordsNotMached
    case wrongPassword
    case wrongEmail
    case unknownError
    case serverError
}

extension Errors: LocalizedError {
    
    var typeOfError: String? {
        switch self {
        case .emptyEmailOrPassword:
            return NSLocalizedString("Empty email or password", comment: "")
        case .passwordsNotMached:
            return NSLocalizedString("Passwords not mached", comment: "")
        case .wrongPassword:
            return NSLocalizedString("Wrong password", comment: "")
        case .wrongEmail:
            return NSLocalizedString("Wrong email", comment: "")
        case .unknownError:
            return NSLocalizedString("Uknown error", comment: "")
        case .serverError:
            return NSLocalizedString("Server error", comment: "")
        }
    }
}
