//
//  UITableView.swift
//
//
//  Created by Yazan Qaisi on 26/05/2024.
//

import UIKit

public extension UITableView {
    func register<T: UITableViewCell>(cell: T.Type) {
        register(cell: cell, bundle: nil)
    }

    func register<T: UITableViewCell>(cell: T.Type, bundle: Bundle?) {
        let defaultBundle = Bundle(for: cell)
        let nib = UINib(nibName: T.identifier, bundle: bundle ?? defaultBundle)
        register(nib, forCellReuseIdentifier: T.identifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(at indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(T.identifier)")
        }
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cellType: T.Type = T.self) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier) as? T else {
            fatalError("Could not dequeue cell with identifier \(T.identifier)")
        }
        return cell
    }
}

public extension UITableView {
    private static let defaultHeaderFooterIdentifier = "Header"

    func register<T: UITableViewHeaderFooterView>(headerFooterView type: T.Type) {
        let nib = UINib(nibName: String(describing: type), bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: UITableView.defaultHeaderFooterIdentifier)
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        let identifier = UITableView.defaultHeaderFooterIdentifier
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T else {
            fatalError("Could not dequeue HeaderFooterView with identifier: \(identifier)")
        }
        return headerFooterView
    }
}
