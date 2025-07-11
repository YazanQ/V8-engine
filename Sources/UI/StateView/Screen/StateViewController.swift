//
//  StateViewController.swift
//  
//
//  Created by Yazan Qaisi on 05/06/2024.
//

import UIKit

public enum ViewState {
    case idle
    case loading
    case failed(Error)
    case render(UIViewController)
}

open class StateViewController: UIViewController {

    private var state: ViewState?
    private var shownViewController: UIViewController?

    public init(state: ViewState = .idle) {
        super.init(nibName: nil, bundle: nil)
        transition(to: state)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }

    public func transition(to newState: ViewState) {
        shownViewController?.remove()
        let contentViewController = viewController(for: newState)
        if let contentViewController {
            add(contentViewController)
        }

        shownViewController = contentViewController
        state = newState
    }
}

private extension StateViewController {
    func viewController(for state: ViewState) -> UIViewController? {
        switch state {
        case .idle:
            return nil
        case .loading:
            return LoadingViewController()
        case let .failed(error):
            return ErrorViewController(error: error)
        case let .render(viewController):
            return viewController
        }
    }
}

private extension StateViewController {
    final class LoadingViewController: UIViewController {
        override func loadView() {
            view = StateView(.loading)
        }
    }

    final class ErrorViewController: UIViewController {
        private let error: Error

        init(error: Error) {
            self.error = error
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) { nil }

        override func loadView() {
            view = StateView(.failed(error))
        }
    }
}

