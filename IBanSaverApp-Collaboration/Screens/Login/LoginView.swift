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
        VStack(spacing: 30) {
            TitleView(title: "Login")
            Spacer()
                .frame(height: 40)
            UserAvatarView()
            TextFieldStackView
            errorTextView
            setupButtonView
            navigateToRegistrationView
            Spacer()
                .frame(height: 40)
        }
        .padding()
    }
    
    // MARK: - Components
    private var navigateToRegistrationView: some View {
        Button(action: {
            presentNavigation()
        }, label: {
            Text("Don't have an account? Register now")
        })
    }
    
    private var errorTextView: some View {
        Text(viewModel.errorMessage)
            .foregroundStyle(AppColor.red)
            .font(.subheadline)
            .multilineTextAlignment(.center)
            .frame(height: 50)
            .padding(.horizontal, 10)
    }
    
    private var setupButtonView: some View {
        ButtonView(
            title: "Login",
            action: {
                viewModel.login()
            },
            buttonColor: viewModel.isValid ? AppColor.blue : AppColor.darkGray, viewModel: viewModel
        )
    }
    
    private func presentNavigation() {
        let registrationView = RegistrationView()
        let hostingController = UIHostingController(rootView: registrationView)
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.rootViewController?.present(hostingController, animated: true, completion: nil)
    }
    
    private var TextFieldStackView: some View {
        VStack(spacing: 20) {
            TextFieldView(
                placeholder: .email,
                text: $viewModel.email
            )
            TextFieldView(
                placeholder: .password,
                text: $viewModel.password,
                isSecure: true
            )
        }
        .padding()
    }
}

struct RegistrationViewRepresentable: UIViewControllerRepresentable {
    //MARK: - Methods
    func makeUIViewController(context: Context) -> UIViewController {
        return UIHostingController(rootView: RegistrationView())
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}


#Preview {
    LoginView()
}
