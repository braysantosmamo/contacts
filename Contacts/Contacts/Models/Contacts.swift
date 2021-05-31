//
//  Contacts.swift
//  Contacts
//
//  Created by Bray on 5/31/21.
//

// To parse the JSON, add this file to your project and do:
//
//   let contacts = try? newJSONDecoder().decode(Contacts.self, from: jsonData)

import Foundation

// MARK: - Contacts
class Contacts: Codable {
    let mamoAccounts: [MamoAccount]

    init(mamoAccounts: [MamoAccount]) {
        self.mamoAccounts = mamoAccounts
    }
}

// MARK: - MamoAccount
class MamoAccount: Codable {
    let id: String
    let key: Key
    let value: String
    let publicName: String?

    init(id: String, key: Key, value: String, publicName: String?) {
        self.id = id
        self.key = key
        self.value = value
        self.publicName = publicName
    }
}

enum Key: String, Codable {
    case email = "email"
    case phone = "phone"
}

