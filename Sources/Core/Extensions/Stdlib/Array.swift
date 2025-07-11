//
//  Array.swift
//
//
//  Created by Yazan Qaisi on 30/05/2024.
//

import Foundation

public extension Array where Element: CaseIterable {
    static var allCases: Self {
        .init(Element.allCases)
    }
}

public extension Array where Element: Equatable {
    mutating func remove(element: Element) {
        if let index = firstIndex(of: element) {
            remove(at: index)
        }
    }
}
