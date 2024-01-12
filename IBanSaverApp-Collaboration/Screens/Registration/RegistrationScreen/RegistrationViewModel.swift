//
//  RegistrationViewModel.swift
//  IBanSaverApp-Collaboration
//
//  Created by Lika Nozadze on 1/12/24.
//

import Foundation

class RegistationViewModel: ObservableObject {
    // MARK: - Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isValid: Bool = false
    
    //MARK: - password Properties
    var meetsLengthRequirement: Bool {
        return password.count >= 8
    }
    
    var meetsUppercaseRequirement: Bool {
        return password.contains(where: { $0.isUppercase })
    }
    
    var meetsNumberRequirement: Bool {
        return password.contains(where: { $0.isNumber })
    }
    
    var meetsSpecialCharRequirement: Bool {
        return password.contains(where: { "!@#$%^&*()".contains($0) })
    }
    
    // MARK: - Password Methods
    func checkPassword(_ password: String) {
        isValid = meetsLengthRequirement && meetsUppercaseRequirement && meetsNumberRequirement && meetsSpecialCharRequirement
    }
    
    // MARK: - Email Properties
    var isEmailValid: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    // MARK: - Email Methods
    func checkEmail(_ email: String) {
        isValid = isEmailValid
    }
}
