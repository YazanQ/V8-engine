//
//  UniversalLinkHandler.swift
//
//
//  Created by Yazan Qaisi on 27/02/2024.
//

import Foundation

public protocol UniversalLinkHandler: ErrorHandler {
    var actionType: UniversalLink.ActionType { get }

    func handle(link: UniversalLink) throws
}
