//
//  IBanDetailsViewModel.swift
//  IBanSaverApp-Collaboration
//
//  Created by nika razmadze on 14.01.24.
//

import Foundation

class IBanDetailsViewModel: ObservableObject {
    // MARK: - Properties
    @Published var IBans: [Bank: [IBAN]]

    // MARK: - init
    init(person: Person) {
        self.IBans = person.ibans
    }

    // MARK: - Methods
    func deleteIBan(IBan: String, bank: Bank) {
        if let index = IBans[bank]?.firstIndex(of: IBan) {
            IBans[bank]?.remove(at: index)
        }
    }
}
