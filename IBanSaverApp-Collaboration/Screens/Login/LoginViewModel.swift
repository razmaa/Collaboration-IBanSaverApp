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
    
    
}
