//
//  Constraints.swift
//  Core Data Best Practices
//
//  Created by Manoj Gadamsetty on 10/03/21.
//  Copyright © 2021 Manoj Gadamsetty. All rights reserved.


import Foundation
import CoreData
import UIKit

extension Category {

    /*
     Open the demo app categories page to see this in action:
     1. Press the add button several times
     2. See multiple SwiftUI Categories arrive
     3. Press save
     4. Only 1 SwiftUI category is left

     This is done by having a constraint configured for the `name` attribute to be unique.

     */
    
    @discardableResult static func insertSample(into context: NSManagedObjectContext) -> Category {
        let category = Category(context: context)
        category.name = "SwiftUI"
        category.color = UIColor(named: "Orange")!
        return category
    }

}
