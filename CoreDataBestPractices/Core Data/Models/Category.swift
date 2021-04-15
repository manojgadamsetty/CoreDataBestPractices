//
//  Category.swift
//  CoreDataBestPractices
//
//  Created by Manoj Gadamsetty on 10/03/21.
//  Copyright © 2021 Manoj Gadamsetty. All rights reserved.


import Foundation
import CoreData
import UIKit

final class Category: NSManagedObject, Identifiable {

    @NSManaged var name: String
    @NSManaged var articlesCount: Int
    @NSManaged var articles: Set<Article>!
    @NSManaged var color: UIColor
}
