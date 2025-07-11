//
//  File.swift
//  
//
//  Created by Yazan Qaisi on 29/05/2024.
//

import Foundation

public protocol KeyboardManager: AnyObject {
    var enable: Bool { get set }
    var enableAutoToolbar: Bool { get set }
    var shouldResignOnTouchOutside: Bool { get set }
}
