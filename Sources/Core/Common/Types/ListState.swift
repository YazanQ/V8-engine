//
//  ListState.swift
//
//
//  Created by Yazan Qaisi on 05/06/2024.
//

import UIKit

public enum ListState<Value> {
    case idle
    case loading
    case populated([Value])
    case paging([Value], nextPage: Int)
    case empty(String = "No Results!", UIImage? = nil)
    case failed(Error, retry: () -> Void = {})

    public var isLoading: Bool {
        switch self {
        case .loading: return true
        default: return false
        }
    }

    public var image: UIImage? {
        guard case let .empty(_, image) = self else {
            return nil
        }
        return image
    }

    public var message: String? {
        switch self {
        case let .empty(message, _):
            return message
        case let .failed(error, retry: _):
            return error.localizedDescription
        default:
            return nil
        }
    }

    public var items: [Value] {
        switch self {
        case let .populated(value):
            return value
        case let .paging(value,_):
            return value
        default:
            return []
        }
    }

    public mutating func update(_ items: [Value]) {
        guard case .populated = self else { return }
        self = .populated(items)
    }

    public mutating func remove(at index: Int) {
        guard case var .populated(items) = self else { return }
        items.remove(at: index)
        self = .populated(items)
    }

    public mutating func update(_ item: Value, at index: Int) {
        guard case var .populated(items) = self else { return }
        items[index] = item
        self = .populated(items)
    }

    public mutating func inset(_ item: Value, at index: Int) {
        guard case var .populated(items) = self else { return }
        items.insert(item, at: index)
        self = .populated(items)
    }
}

public extension ListState {
    func asAnyState() -> ListState<Any> {
        switch self {
        case .idle: return .idle
        case .loading: return .loading

        case let .empty(message, image): return .empty(message, image)
        case let .failed(error, retry): return .failed(error, retry: retry)

        case let .populated(items): return .populated(items)
        case let .paging(items, nextPage): return .paging(items, nextPage: nextPage)
        }
    }
}
