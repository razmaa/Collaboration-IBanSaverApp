//
//  AuthenticationManager.swift
//  IBanSaverApp-Collaboration
//
//  Created by Eka Kelenjeridze on 12.01.24.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager {
    //MARK: - Properties
    static let shared = AuthenticationManager()
    
    //MARK: - Init
    private init() { }
    
    //MARK: - Methods
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }
    
    func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authenticationDataResults = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authenticationDataResults.user)
    }
    
    func registerUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authenticationDataResults = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authenticationDataResults.user)
    }
}
