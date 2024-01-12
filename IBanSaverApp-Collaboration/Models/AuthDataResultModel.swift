//
//  AuthDataResultModel.swift
//  IBanSaverApp-Collaboration
//
//  Created by Eka Kelenjeridze on 12.01.24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    //MARK: - Properties
    let UID: String
    let email: String?
    let photoURL: String?
    
    //MARK: - Init
    init(user: User) {
        self.UID = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
}
