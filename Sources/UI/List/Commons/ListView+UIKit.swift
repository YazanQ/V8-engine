//
//  ListView+UIKit.swift
//
//
//  Created by Yazan Qaisi on 05/06/2024.
//

import UIKit
import Core

public extension UITableView {
    func transition<Item>(to state: ListState<Item>) {
        if !state.isLoading { refreshControl?.endRefreshing() }
        backgroundView = state.backgroundView
        tableFooterView = state.footeView(for: self)
        tableHeaderView?.isHidden = state.items.isEmpty
        tableFooterView?.isHidden = state.items.isEmpty
        reloadData()
    }
}


private extension ListState {
    var backgroundView: UIView? {
        switch self {
        case .idle, .populated, . paging:
            return nil
        case .loading:
            return StateView(.loading)
        case let .empty(message, image):
            return StateView(.empty(message, image))
        case let .failed(error, retry):
            return StateView(.failed(error, retry: retry))
        }
    }

    func footeView(for tableView: UITableView) -> UIView? {
        switch self {
        case .paging:
            return StateView(.loading).with(\.identifier, .stateView)

        default:
            return tableView.find(byId: .stateView) == nil ? tableView.tableFooterView : nil
        }
    }
}
