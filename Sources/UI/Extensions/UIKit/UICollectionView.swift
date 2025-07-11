//
//  File.swift
//  
//
//  Created by Yazan Qaisi on 02/06/2024.
//

import UIKit

public extension UICollectionView {
    func register<T: UICollectionViewCell>(cell: T.Type) {
        register(cell: cell, bundle: nil)
    }

    func register<T: UICollectionViewCell>(cell: T.Type, bundle: Bundle?) {
        let defaultBundle = Bundle(for: cell)
        let nib = UINib(nibName: T.identifier, bundle: bundle ?? defaultBundle)
        register(nib, forCellWithReuseIdentifier: T.identifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(at indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(T.identifier)")
        }
        return cell
    }
}
