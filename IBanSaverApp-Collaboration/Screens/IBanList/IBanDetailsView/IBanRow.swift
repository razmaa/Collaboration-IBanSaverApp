//
//  IBanRow.swift
//  IBanSaverApp-Collaboration
//
//  Created by nika razmadze on 14.01.24.
//

import SwiftUI

struct IBanRow: View {
    let iban: String
    let bank: String
    let deleteAction: () -> Void
    let shareAction: () -> Void

    var body: some View {
        HStack {
            Text("\(bank): \(iban)")
            
            Button(action: {
                UIPasteboard.general.string = iban
            }) {
                Image(systemName: "doc.on.doc")
            }
            
            Button(action: shareAction) {
                Image(systemName: "square.and.arrow.up")
            }
            
            Button(action: deleteAction) {
                Image(systemName: "trash")
            }
        }
        .padding()
    }
}
