//
//  ViewFactory.swift
//
//
//  Created by Yazan Qaisi on 13/03/2024.
//

import UIKit

public enum ViewFactory {}

public extension UIStoryboard {
    convenience init(named: String) {
        self.init(name: named, bundle: .main)
    }

    func makeViewController<T>() -> T {
        let identifier = String(describing: T.self)

        guard let viewController = instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Could not instantiate view controller with identifier: \(identifier)")
        }
        return viewController
    }
}
