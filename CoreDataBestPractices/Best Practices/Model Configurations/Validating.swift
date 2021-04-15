//
//  Validating.swift
//  Core Data Best Practices
//
//  Created by Manoj Gadamsetty on 10/03/21.
//  Copyright © 2021 Manoj Gadamsetty. All rights reserved.

import Foundation

extension Article {
    enum Error: Swift.Error, LocalizedError {
        case protectedName(name: String)

        var recoverySuggestion: String? {
            switch self {
            case .protectedName(let name):
                return "The name '\(name)' is protected and can't be used."
            }
        }
    }

    override func validateForInsert() throws {
        try super.validateForInsert()
        try validateName()
    }

    override func validateForDelete() throws {
        try super.validateForDelete()
    }

    override func validateForUpdate() throws {
        try super.validateForUpdate()
        try validateName()
    }

    private func validateName() throws {
        let protectedNames: [String] = ["swiftlee", "antoine", "nsspain"]

        guard !protectedNames.contains(name.lowercased()) else {
            throw Error.protectedName(name: name)
        }
    }
}
