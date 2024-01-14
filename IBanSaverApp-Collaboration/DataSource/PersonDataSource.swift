//
//  PersonDataSource.swift
//  IBanSaverApp-Collaboration
//
//  Created by nika razmadze on 14.01.24.
//

import Foundation
import Combine

final class PersonDataSource: ObservableObject {
    private var persons: [Person] = [
        Person(name: "Ilia ", surname: "Tchavtchavadze"),
        Person(name: "Shota", surname: "Rustaveli"),
    ]
    
    func addPerson(_ person: Person) {
        persons.append(person)
    }
    
    func getAllPerson() -> [Person] {
        persons
    }
}
