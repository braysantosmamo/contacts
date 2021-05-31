//
//  FreqContacts.swift
//  Contacts
//
//  Created by Bray on 5/31/21.
//

// To parse the JSON, add this file to your project and do:
//
//   let freqContacts = try? newJSONDecoder().decode(FreqContacts.self, from: jsonData)

import Foundation

// MARK: - FreqContacts
class FreqContacts: Codable {
    let frequents: [Frequent]

    init(frequents: [Frequent]) {
        self.frequents = frequents
    }
}

// MARK: - Frequent
class Frequent: Codable {
    let id, publicName: String

    init(id: String, publicName: String) {
        self.id = id
        self.publicName = publicName
    }
}
