//
//  AddPerson.swift
//  IBanSaverApp-Collaboration
//
//  Created by Natia Khizanishvili on 13.01.24.
//

import SwiftUI

struct AddPersonView: View {
    // MARK: - Properties
    @State private var name: String = ""
    @State private var surname: String = ""
    
    @EnvironmentObject private var personDataSource: PersonDataSource
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Body
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Name", text: $name)
                    TextField("Surname", text: $surname)
                }
            }
            
            Spacer()
            
            addButton
        }
        .navigationTitle("Add Person")
    }
    
    // MARK: - Components
    private var addButton: some View {
        Button(action: {
            let person = Person(name: name, surname: surname)
            personDataSource.addPerson(person)
            dismiss()
        }) {
            Text("Add Person")
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
        }
        .padding()
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        AddPersonView()
            .environmentObject(PersonDataSource())
    }
}
