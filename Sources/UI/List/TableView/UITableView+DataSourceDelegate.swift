//
//  UITableView+DataSourceDelegate.swift
//
//
//  Created by Yazan Qaisi on 05/06/2024.
//

import UIKit
import Core

// MARK: DataSource

public extension UITableView {
    func dataSource<Item>(cellProvider: @escaping TableViewCellProvider<Item>) -> TableViewDataSource<Item> {
        .init(cellProivder: cellProvider)
    }

    func dataSource<Cell: TableViewCell>(
        cellType: Cell.Type,
        configure: @escaping (Cell) -> Void = { _ in }
    ) -> TableViewDataSource<Cell.Item> {
        .init(cellType: cellType, configure: configure)
    }
}

// MARK: Delegate

public extension UITableView {
    func didSelectRow(_ action: @escaping DidSelectRowAction) {
        delegateProxy.didSelectRow = { action($0) }
    }

    func willDisplayCell(_ action: @escaping WillDisplayCellAction) {
        delegateProxy.willDisplayCell = { action($0) }
    }

    func heightForRow(_ action: @escaping HeightForRowAction) {
        delegateProxy.heightForRow = { action($0) }
    }
    
    func viewForHeader(_ action: @escaping ViewForHeaderAction) {
        delegateProxy.viewForHeader = { action($0) }
    }

    func heightForHeader(_ action: @escaping HeightForHeaderAction) {
        delegateProxy.heightForHeaderAction = { action($0) }
    }

    func viewForFooter(_ action: @escaping ViewForFooterAction) {
        delegateProxy.viewForFooter = { action($0) }
    }

    func heightForFooter(_ action: @escaping HeightForFooterAction) {
        delegateProxy.heightForFooterAction = { action($0) }
    }

    private var delegateProxy: TableViewDelegate {
        .createDelegateProxy(for: self)
    }
}

public extension UITableView {
    func scrollViewDidScroll(_ action: @escaping ScrollViewAction) {
        delegateProxy.scrollViewDidScroll = { action($0) }
    }

    func scrollViewDidEndDeceleration(_ action: @escaping ScrollViewAction) {
        delegateProxy.scrollViewDidEndDeceleration = { action($0) }
    }
}
