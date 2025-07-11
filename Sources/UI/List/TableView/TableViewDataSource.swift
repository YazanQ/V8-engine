//
//  File.swift
//  
//
//  Created by Yazan Qaisi on 05/06/2024.
//

import UIKit
import Core

public typealias ListViewHeader = UIView & Configurable
public typealias TableViewCell = Configurable & UITableViewCell
public typealias TableViewCellProvider<Item> = (UITableView, IndexPath, Item) -> UITableViewCell

public final class TableViewDataSource<Item>: NSObject, UITableViewDataSource {
    
    private var cellProvider: TableViewCellProvider<Item>
    public private(set) var state: ListState<Item> = .loading
    public var items: [Item] { state.items }

    public init<Cell: TableViewCell>(
        cellType: Cell.Type,
        configure: @escaping (Cell) -> Void = { _ in }
    ) where Cell.Item == Item {
        self.cellProvider = { tableView, indexPath, item in
            let cell: Cell = tableView.dequeueReusableCell(at: indexPath)
            cell.configure(with: item)
            configure(cell)
            return cell
        }
    }

    public init(cellProivder: @escaping TableViewCellProvider<Item>) {
        self.cellProvider = cellProivder
    }

    @discardableResult
    public func update(_ state: ListState<Item>) -> Self {
        self.state = state
        return self
    }

    @discardableResult
    public func update(_ items: [Item]) -> Self {
        update(.populated(items))
        return self
    }

    @discardableResult
    public func update(_ item: Item) -> Self {
        update(.populated([item]))
        return self
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        state.items.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellProvider(tableView, indexPath, state.items[indexPath.row])
    }
}
