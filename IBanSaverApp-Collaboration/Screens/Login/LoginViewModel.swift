//
//  LoginViewModel.swift
//  IBanSaverApp-Collaboration
//
//  Created by Eka Kelenjeridze on 11.01.24.
//

import Foundation

// MARK: - Enum
enum LoginState: String {
    case emptyFields = "Email and/or password fields cannot be empty."
    case invalidCredentials = "Invalid login credentials. Please verify your entered data and try again."
    case validCredentials = "Login Succeeded."
}

final class LoginViewModel: ObservableObject {
    // MARK: - Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isValid: Bool = false
    
    private var UID: String {
           do {
               let authenticatedUser = try AuthenticationManager.shared.getAuthenticatedUser()
               return authenticatedUser.UID
           } catch {
               print("Error getting authenticated user: \(error)")
               return ""
           }
       }
    
    // MARK: - Methods
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            print(LoginState.emptyFields.rawValue)
            return
        }
        
        Task {
            do {
                let authenticatedUser = try AuthenticationManager.shared.getAuthenticatedUser()
                
                if email.lowercased() == authenticatedUser.email?.lowercased() ?? "" && UID == authenticatedUser.UID {
                    isValid = true
                    print(LoginState.validCredentials.rawValue)
                } else {
                    print(LoginState.invalidCredentials.rawValue)
                }
            }  catch {
                print("Error: \(error)")
            }
        }
    }
}






//    guard !email.isEmpty, !password.isEmpty else {
//        print("no such user found")
//        return
//    }
//
//    Task {
//        do {
//            let returnedUserData = try await AuthenticationManager.shared.signInUser(email: email, password: password)
//            print("success")
//            print(returnedUserData)
//        } catch {
//            print("Error: \(error)")
//        }
//    }
//}
