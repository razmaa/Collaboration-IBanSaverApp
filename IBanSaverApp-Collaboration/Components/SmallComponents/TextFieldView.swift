//
//  TextFieldView.swift
//  IBanSaverApp-Collaboration
//
//  Created by Lika Nozadze on 1/12/24.
//

import SwiftUI

struct TextFieldView: View {
    // MARK: - Properties
    var placeholder: PlaceholderText
    var customPlaceholder: String?
    var text: Binding<String>
    var isSecure = false
    
    // MARK: - Body
    var body: some View {
        Group {
            if isSecure {
                SecureField(customPlaceholder ?? placeholder.rawValue, text: text)
            } else {
                TextField(customPlaceholder ?? placeholder.rawValue, text: text)
            }
        }
        .padding()
        .background(AppColor.lightGray)
        .cornerRadius(8)
    }
}

// MARK: - Enum
enum PlaceholderText: String {
    case email = "Enter your Email"
    case password = "Enter your Password"
    case custom = ""
}

#Preview {
    TextFieldView(placeholder: .email, text: .constant(""))
}
