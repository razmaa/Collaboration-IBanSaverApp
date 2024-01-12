//
//  ButtonView.swift
//  IBanSaverApp-Collaboration
//
//  Created by Lika Nozadze on 1/12/24.
//

import SwiftUI

struct ButtonView<ViewModelType: ObservableObject>: View {
    
    // MARK: - Properties
    var title: String
    var action: () -> Void
    var buttonColor: Color = AppColor.blue
    @ObservedObject var viewModel: ViewModelType
    
    // MARK: - Body
    var body: some View {
        buttonView
    }
    
    // MARK: - Components
    var buttonView: some View {
        Button(action: action, label: {
            buttonLabelView
        })
        .frame(width: 200)
        .padding()
        .background(buttonColor)
        .cornerRadius(8)
        .foregroundColor(.white)
    }
    
    var buttonLabelView: some View {
        Text(title)
            .font(.headline)
            .bold()
            .foregroundStyle(.white)
    }
}

//#Preview {
//    ButtonView(title: "Register", action: {}, viewModel: ViewModelType())
//}
