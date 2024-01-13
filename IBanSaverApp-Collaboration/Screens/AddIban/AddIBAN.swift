//
//  AddIBAN.swift
//  IBanSaverApp-Collaboration
//
//  Created by Natia Khizanishvili on 13.01.24.
//

import SwiftUI

struct AddIBANView: View {
    @Environment(\.dismiss) var dismiss
    
    let person: Person
    
    @State private var bank: String = ""
    @State private var iban: String = ""
    
    init(person: Person) {
        self.person = person
    }

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Bank Information")) {
                        TextField("Bank", text: $bank)
                        TextField("IBAN", text: $iban)
                    }
                }

                Spacer()

                addButton
            }
            .navigationTitle("Add IBAN")
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
                .background(Color.green)
                .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    AddIBANView(person: Person(name: "Ilia", surname: "Tchavtchavadze"))
}
