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
    
    // MARK: - Methods
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            print("no such user found")
            return
        }
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.signInUser(email: email, password: password)
                print("success")
                print(returnedUserData)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
