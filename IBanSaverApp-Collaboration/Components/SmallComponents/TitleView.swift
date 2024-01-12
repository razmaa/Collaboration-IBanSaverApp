//
//  TitleView.swift
//  IBanSaverApp-Collaboration
//
//  Created by Lika Nozadze on 1/12/24.
//

import SwiftUI

struct TitleView: View {
    //MARK: - Properties
    var title: String
    
    //MARK: - Body
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 10)
            .padding(.leading, 10)
            .foregroundStyle(AppColor.blue)
    }
}

#Preview {
    TitleView(title: "Sign In")
}
