//
//  Configurable.swift
//
//
//  Created by Yazan Qaisi on 05/06/2024.
//

import Foundation

public protocol Configurable {
    associatedtype Item

    func configure(with item: Item)
}
