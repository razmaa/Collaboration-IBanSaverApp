//
//  LoginView.swift
//  IBanSaverApp-Collaboration
//
//  Created by nika razmadze on 11.01.24.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    @StateObject var viewModel = LoginViewModel()
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 40) {
            TitleView(title: "Login")
            Spacer()
            UserAvatarView()
            TextFieldStackView
            Spacer()
            setupButtonView
            Spacer()
        }
        .padding()
    }
    
    // MARK: - Components
    private var setupButtonView: some View {
        ButtonView(title: "Login", action: {}, buttonColor: viewModel.isValid ? AppColor.blue : AppColor.darkGray, viewModel: viewModel)
    }
    
    private var TextFieldStackView: some View {
        VStack(spacing: 20) {
            TextFieldView(placeholder: .email, text: $viewModel.email)
            TextFieldView(placeholder: .password, text: $viewModel.password, isSecure: true)
        }
        .padding()
    }
}


#Preview {
    LoginView()
}
