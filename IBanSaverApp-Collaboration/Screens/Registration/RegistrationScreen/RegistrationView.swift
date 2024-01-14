//
//  RegistrationView.swift
//  IBanSaverApp-Collaboration
//
//  Created by Lika Nozadze on 1/12/24.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - Properties
    @StateObject var viewModel = RegistationViewModel()

    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 40) {
            TitleView(title: "Sign Up")
            UserAvatarView()
            TextFieldStackView
            setupPasswordRestrictionsView
            setupButtonView
        }
        .padding()

    }
    
    // MARK: - Components
    private var setupButtonView: some View {
        ButtonView(title: "Register", action: viewModel.registration, buttonColor: (viewModel.isEmailValid && viewModel.isValid) ? AppColor.blue : AppColor.darkGray, viewModel: viewModel)
    }

    private var setupPasswordRestrictionsView: some View {
        PasswordRestrictionsView(
            viewModel: viewModel,
            password: viewModel.password,
            isValid: viewModel.isValid,
            meetsLengthRequirement: viewModel.meetsLengthRequirement,
            meetsUppercaseRequirement: viewModel.meetsUppercaseRequirement,
            meetsNumberRequirement: viewModel.meetsNumberRequirement,
            meetsSpecialCharRequirement: viewModel.meetsSpecialCharRequirement
        )
    }
    
    private var TextFieldStackView: some View {
        VStack(spacing: 20) {
            TextFieldView(placeholder: .email, text: $viewModel.email)
            TextFieldView(placeholder: .password, text: $viewModel.password, isSecure: true)
                .onChange(of: viewModel.password, { oldValue, newValue in
                    viewModel.checkPassword(newValue)
                })
        }
        .padding()
    }
}

#Preview {
    RegistrationView()
}
