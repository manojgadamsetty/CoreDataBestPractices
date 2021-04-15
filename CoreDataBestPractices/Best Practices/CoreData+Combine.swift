//
//  CoreData+Combine.swift
//  Core Data Best Practices
//
//  Created by Manoj Gadamsetty on 10/03/21.
//  Copyright © 2021 Manoj Gadamsetty. All rights reserved.


import Foundation

extension ArticleListCell {

    /**
     Diffable Data Sources (DDS) are great but don't support reloads out of the box.
     Another option is to use Combine. This way, you can observe key paths as shown in this example.
     */

    func updateCombineObservers() {
        guard let article = article else { return }

        article.publisher(for: \.categoryName, options: .new).sink { [weak self] _ in
            self?.setNeedsUpdateConfiguration()
        }.store(in: &cancellables)
    }
}
