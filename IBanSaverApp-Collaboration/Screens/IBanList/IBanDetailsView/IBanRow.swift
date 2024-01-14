//
//  IBanRow.swift
//  IBanSaverApp-Collaboration
//
//  Created by nika razmadze on 14.01.24.
//

import SwiftUI

struct IBanRow: View {
    // MARK: - Properties
    let iban: String
    let bank: String
    let deleteAction: () -> Void
    let shareAction: () -> Void

    // MARK: - Body
    var body: some View {
        HStack {
            Text("\(bank): \(iban)")
            
            Button(action: {
                UIPasteboard.general.string = iban
            }) {
                Image(systemName: "doc.on.doc")
                    .foregroundStyle(AppColor.blue)
            }
            
            Button(action: shareAction) {
                Image(systemName: "square.and.arrow.up")
                    .foregroundStyle(AppColor.blue)
            }
            
            Button(action: deleteAction) {
                Image(systemName: "trash")
                    .foregroundStyle(AppColor.blue)
            }
        }
        .padding()
    }
}
