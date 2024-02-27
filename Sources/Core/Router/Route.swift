//
//  Route.swift
//
//
//  Created by Yazan Qaisi on 27/02/2024.
//

import Foundation

public protocol Route {}

public extension Route {
    func asAnyRoute() -> AnyRoute {
        .init(route: self)
    }
}

public struct AnyRoute: Route {
    public let route: Route

    public init(route: Route) {
        self.route = route
    }
}
