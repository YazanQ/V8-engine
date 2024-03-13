//
//  UIApplication.swift
//
//
//  Created by Yazan Qaisi on 13/03/2024.
//

import UIKit

public extension UIApplication {
    var currentWindow: UIWindow? {
        windows.first(where: \.isKeyWindow)
    }
}
