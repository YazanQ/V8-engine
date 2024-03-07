//
//  LoadingState.swift
//
//
//  Created by Yazan Qaisi Trend on 07/03/2024.
//

import Foundation

public enum LoadingState {
    case idle
    case loading

    public var isIdle: Bool { self == .idle }
    public var isLoading: Bool { self == .loading }

    public mutating func toggle() {
        switch self {
        case .idle:
            self = .loading
        case .loading:
            self = .idle
        }
    }

}
