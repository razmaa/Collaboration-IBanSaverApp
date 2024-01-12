//
//  PasswordRestrictionsView.swift
//  IBanSaverApp-Collaboration
//
//  Created by Lika Nozadze on 1/12/24.
//

import SwiftUI

struct PasswordRestrictionsView<ViewModelType: ObservableObject>: View {
    // MARK: - Properties
    @ObservedObject var viewModel: ViewModelType
    var password: String
    var isValid: Bool
    var meetsLengthRequirement: Bool
    var meetsUppercaseRequirement: Bool
    var meetsNumberRequirement: Bool
    var meetsSpecialCharRequirement: Bool
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            Text("Password must contain:")
                .foregroundColor(AppColor.textSecondary)
            passwordRequirementsView("At least 8 characters", meetsRequirement: meetsLengthRequirement)
            passwordRequirementsView("At least one uppercase letter", meetsRequirement: meetsUppercaseRequirement)
            passwordRequirementsView("At least one number", meetsRequirement: meetsNumberRequirement)
            passwordRequirementsView("At least one special character", meetsRequirement: meetsSpecialCharRequirement)
        }
        .padding()
        .foregroundColor(validationColor)
        .font(.subheadline)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(AppColor.darkGray, lineWidth: 1)
        )
    }
    
    // MARK: - Components
    private func passwordRequirementsView(_ requirement: String, meetsRequirement: Bool) -> some View {
        HStack {
            Image(systemName: meetsRequirement ? "circle.fill" : "circle")
                .resizable()
                .frame(width: 8, height: 8)
            Text(requirement)
        }
        .foregroundColor(password.isEmpty ? AppColor.textSecondary : meetsRequirement ? AppColor.green : AppColor.red)
    }
    
    private var validationColor: Color {
        if password.isEmpty {
            return AppColor.textSecondary
        } else {
            return isValid ? AppColor.green : AppColor.red
        }
    }
}

//#Preview {
//    PasswordRestrictionsView(viewModel: PasswordViewModel(), password: "", isValid: true, meetsLengthRequirement: true, meetsUppercaseRequirement: true, meetsNumberRequirement: false, meetsSpecialCharRequirement: false)
//}
