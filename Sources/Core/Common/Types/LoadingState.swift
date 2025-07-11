//
//  LoadingState.swift
//
//
//  Created by Yazan Qaisi on 29/05/2024.
//

import Foundation

public enum LoadingState {
    case idle
    case loading

    /// indicate if the loader is in idle state
    public var isIdle: Bool { self == .idle }
    /// indicate if the loader is in loading state
    /// - you can change this in your view model
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
