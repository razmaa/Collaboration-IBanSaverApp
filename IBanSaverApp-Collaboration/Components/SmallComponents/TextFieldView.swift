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
    var text: Binding<String>
    var isSecure = false
    
    // MARK: - Body
    var body: some View {
        Group {
            if isSecure {
                SecureField(placeholderText, text: text)
            } else {
                TextField(placeholderText, text: text)
            }
        }
        .padding()
        .background(AppColor.lightGray)
        .cornerRadius(8)
    }
    
    // MARK: - Components
    var placeholderText: String {
        return placeholder.rawValue
    }
}

// MARK: - Enum
enum PlaceholderText: String {
    case email = "Enter your Email"
    case password = "Enter your Password"
}

#Preview {
    TextFieldView(placeholder: .email, text: .constant(""))
}
