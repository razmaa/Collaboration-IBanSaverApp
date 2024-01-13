//
//  AddIBAN.swift
//  IBanSaverApp-Collaboration
//
//  Created by Natia Khizanishvili on 13.01.24.
//

import SwiftUI

struct AddIBANView: View {
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    
    let person: Person
    
    @State private var bank: String = ""
    @State private var iban: String = ""
    
    @State private var isScanningSheetPresented = false
    
    // MARK: - Init
    init(person: Person) {
        self.person = person
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Bank Information")) {
                    TextField("Bank", text: $bank)
                    HStack {
                        TextField("IBAN", text: $iban)
                        showScannerButton
                    }
                }
            }
            
            Spacer()
            
            addButton
        }
        .navigationTitle("Add IBAN")
    }
    
    // MARK: - Components
    private var showScannerButton: some View {
        Button(action: { isScanningSheetPresented.toggle() } ) {
            Image(systemName: "qrcode.viewfinder")
                .font(.headline)
                .padding(2)
                .foregroundColor(.white)
                .background(AppColor.blue)
                .cornerRadius(4)
        }
        .padding()
        .sheet(isPresented: $isScanningSheetPresented) {
            QRScannerView(didFindCode: { scannedIBAN in
                iban = scannedIBAN.components(separatedBy: "/").last ?? ""
                isScanningSheetPresented.toggle()
            })
        }
    }
    
    private var addButton: some View {
        Button(action: {
            person.addIBAN(iban, for: bank)
            
            dismiss()
        }) {
            Text("Add IBAN")
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(AppColor.blue)
                .cornerRadius(8)
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        AddIBANView(person: Person(name: "Ilia", surname: "Tchavtchavadze"))
    }
}
