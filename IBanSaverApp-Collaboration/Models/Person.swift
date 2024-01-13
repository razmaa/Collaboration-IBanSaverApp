//
//  Person.swift
//  IBanSaverApp-Collaboration
//
//  Created by Natia Khizanishvili on 13.01.24.
//

import Foundation

class Person: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let surname: String
    var ibans: [Bank: [IBAN]] = [:]
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
    
    func addIBAN(_ iban: IBAN, for bank: Bank) {
        if var bankIBANs = ibans[bank]   {
            bankIBANs.append(iban)
            ibans[bank] = bankIBANs
        } else {
            ibans[bank] = [iban]
        }
    }
}
