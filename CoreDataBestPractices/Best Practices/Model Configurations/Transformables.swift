//
//  Transformables.swift
//  Core Data Best Practices
//
//  Created by Manoj Gadamsetty on 10/03/21.
//  Copyright © 2021 Manoj Gadamsetty. All rights reserved.


import Foundation
import UIKit

/*
 For storing enums, see `Article.source`.

 ValueTransformers in Core Data are a powerful way of transforming values before they get inserted into the database and before they get read. They’re set up in an abstract class which handles the value transformations from one representation to another.
 */

// A value transformer which transforms `UIColor` instances into data using `NSSecureCoding`.
@objc(UIColorValueTransformer)
final class UIColorValueTransformer: ValueTransformer {
    override public class func transformedValueClass() -> AnyClass {
        return UIColor.self
    }

    override public class func allowsReverseTransformation() -> Bool {
        return true
    }

    override public func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? UIColor else { return nil }

        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
            return data
        } catch {
            assertionFailure("Failed to transform `UIColor` to `Data`")
            return nil
        }
    }

    override public func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? NSData else { return nil }

        do {
            let colour = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data as Data)
            return colour
        } catch {
            assertionFailure("Failed to transform `Data` to `UIColor`")
            return nil
        }
    }
}

extension UIColorValueTransformer {
    // The name of the transformer. This is the name used to register the transformer using `ValueTransformer.setValueTrandformer(_"forName:)`.
    static let name = NSValueTransformerName(rawValue: String(describing: UIColorValueTransformer.self))

    // Registers the value transformer with `ValueTransformer`.
    public static func register() {
        let transformer = UIColorValueTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }
}

extension PersistentContainer {
    func registerValueTransformers() {
        UIColorValueTransformer.register()
    }
}
