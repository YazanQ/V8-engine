//
//  ArrayBuilder.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation

@resultBuilder
public struct ArrayBuilder<T> {
    public static func buildBlock(_ elements: T...) -> [T] {
        elements
    }
}
