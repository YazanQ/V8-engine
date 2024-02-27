//
//  MultipartFormItem.swift
//
//
//  Created by Yazan Qaisi on 22/02/2024.
//

import Foundation

public struct MultipartFormItem {
    public let name: String
    public let data: Data

    public init(name: String, data: Data) {
        self.name = name
        self.data = data
    }
}
