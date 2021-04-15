//
//  FetchedResultsController.swift
//  Core Data Best Practices
//
//  Created by Manoj Gadamsetty on 10/03/21.
//  Copyright © 2021 Manoj Gadamsetty. All rights reserved.


import Foundation
import CoreData

extension NSFetchedResultsController {

    @objc static func articlesFetchedResultsController() -> NSFetchedResultsController<Article> {
        // Presentation: rewrite this using 'Managed'.
        let fetchRequest = Article.listAllFetchRequest()

        return NSFetchedResultsController<Article>(fetchRequest: fetchRequest, managedObjectContext: PersistentContainer.shared.viewContext, sectionNameKeyPath: nil, cacheName: nil)
    }
}
