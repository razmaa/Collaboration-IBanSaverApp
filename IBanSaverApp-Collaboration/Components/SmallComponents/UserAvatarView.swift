//
//  UserAvatarView.swift
//  IBanSaverApp-Collaboration
//
//  Created by Lika Nozadze on 1/12/24.
//

import SwiftUI

struct UserAvatarView: View {
    // MARK: - Body
    var body: some View {
        Image("userAvatar")
            .resizable()
            .frame(width: 150, height: 145)
            .clipShape(Circle())
    }
}

#Preview {
    UserAvatarView()
}
