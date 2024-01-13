//
//  LoginViewModel.swift
//  IBanSaverApp-Collaboration
//
//  Created by Eka Kelenjeridze on 11.01.24.
//

import Foundation

final class LoginViewModel: ObservableObject {
    // MARK: - Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isValid: Bool = false
    @Published var errorMessage: String = ""
    
    // MARK: - Methods
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            print(LoginState.emptyFields.rawValue)
            return
        }
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.signInUser(email: email, password: password)
                print(LoginState.validCredentials.rawValue)
                print(returnedUserData)
            }
            catch {
                errorMessage = LoginState.invalidCredentials.rawValue
                print(LoginState.invalidCredentials.rawValue)
                print("Error: \(error)")
            }
        }
    }
}

// MARK: - Enum
enum LoginState: String {
    case emptyFields = "Email and/or password fields cannot be empty."
    case invalidCredentials = "Invalid login credentials. Please verify your entered data and try again."
    case validCredentials = "Login Succeeded."
}
