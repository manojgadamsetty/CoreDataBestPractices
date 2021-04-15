//
//  PersistentHistoryTracking.swift
//  Core Data Best Practices
//
//  Created by Manoj Gadamsetty on 10/03/21.
//  Copyright © 2021 Manoj Gadamsetty. All rights reserved.


import Foundation
import CoreData

extension PersistentContainer {
    func enablePersistentHistoryTracking() {
        let storeDescription = persistentStoreDescriptions.first!

        // Enable Persistent History Tracking
        storeDescription.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)

        // Register to receive remote change notifications
        storeDescription.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)

        persistentStoreDescriptions = [storeDescription]
    }

    func startObservingPersistentHistoryTransactions() -> PersistentHistoryObserver {
        let observer = PersistentHistoryObserver(target: .app, persistentContainer: self, userDefaults: .standard)

        viewContext.name = "view_context"
        viewContext.transactionAuthor = "main_app_view_context"

        observer.startObserving()
        return observer
    }
}
