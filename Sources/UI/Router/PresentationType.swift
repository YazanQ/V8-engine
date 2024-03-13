//
//  PresentationType.swift
//
//
//  Created by Yazan Qaisi on 13/03/2024.
//

import Foundation

public enum PresentationType {
    case push
    case present
    case presentNavigation(isHidden: Bool = true)
    case root(isNavigationHidden: Bool = true)
}
