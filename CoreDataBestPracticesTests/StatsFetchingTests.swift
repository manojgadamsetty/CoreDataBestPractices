//
//  StatsFetchingTests.swift
//  CoreDataBestPracticesTests
//
//  Created by Manoj Gadamsetty on 10/03/21.
//  Copyright © 2021 Manoj Gadamsetty. All rights reserved.


import XCTest
import CoreData
@testable import Core_Data_Best_Practices

final class StatsFetchingTests: CoreDataTestCase {

    func testArticlesCount() throws {
        let expectedCount = 5
        let category = Category.insertSample(into: container.viewContext)
        (0..<expectedCount).forEach { index in
            let article = Article(context: container.viewContext)
            article.name = String(format: "Generated %05d", index)
            article.category = category
            article.source = .generated
            article.views = Int.random(in: 0..<1000)
        }
        let articlesCount = Article.totalNumber(in: container.viewContext)
        XCTAssertEqual(articlesCount, expectedCount)
    }
}
