//
//  DiffableDataSources.swift
//  Core Data Best Practices
//
//  Created by Manoj Gadamsetty on 10/03/21.
//  Copyright © 2021 Manoj Gadamsetty. All rights reserved.


import Foundation
import CoreData
import UIKit

// Diffable Data Sources are supported when using a Fetched Results Controller.
// Simply use the single delegate method available and apply the new snapshot.
//

extension ArticlesListCollectionViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChangeContentWith snapshot: NSDiffableDataSourceSnapshotReference) {
        dataSource.apply(snapshot as NSDiffableDataSourceSnapshot<Section, NSManagedObjectID>, animatingDifferences: true)
    }
}
