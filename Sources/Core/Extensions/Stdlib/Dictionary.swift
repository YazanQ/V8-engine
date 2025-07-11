//
//  Dictionary.swift
//
//
//  Created by Yazan Qaisi on 23/05/2024.
//

import Foundation

public extension Dictionary {
    var jsonString: String? {
        guard
            let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted),
            let string = String(data: data, encoding: .utf8)
        else {
            return ""
        }

        return string
    }

    var jsonData: Data? {
        guard JSONSerialization.isValidJSONObject(self) else {
            return nil
        }

        return try? JSONSerialization.data(withJSONObject: self, options: [])
    }
}
