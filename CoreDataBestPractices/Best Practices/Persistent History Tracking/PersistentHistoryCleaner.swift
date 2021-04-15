//
//  PersistentHistoryCleaner.swift
//  Core Data Best Practices
//
//  Created by Manoj Gadamsetty on 10/03/21.
//  Copyright © 2021 Manoj Gadamsetty. All rights reserved.

import Foundation
import CoreData

struct PersistentHistoryCleaner {

    let context: NSManagedObjectContext
    let targets: [AppTarget]
    let userDefaults: UserDefaults

    // Cleans up the persistent history by deleting the transactions that have been merged into each target.
    func clean() throws {
        guard let timestamp = userDefaults.lastCommonTransactionTimestamp(in: targets) else {
            print("Cancelling deletions as there is no common transaction timestamp")
            return
        }

        let deleteHistoryRequest = NSPersistentHistoryChangeRequest.deleteHistory(before: timestamp)
        print("Deleting persistent history using common timestamp \(timestamp)")
        try context.execute(deleteHistoryRequest)

        targets.forEach { target in
            /// Reset the dates as we would otherwise end up in an infinite loop.
            userDefaults.updateLastHistoryTransactionTimestamp(for: target, to: nil)
        }
    }
}
