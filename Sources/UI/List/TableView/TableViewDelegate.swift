//
//  TableViewDelegate.swift
//
//
//  Created by Yazan Qaisi on 05/06/2024.
//

import UIKit
import Core

public typealias ScrollViewAction = (UIScrollView) -> Void
public typealias DidSelectRowAction = (IndexPath) -> Void
public typealias WillDisplayCellAction = (IndexPath) -> Void
public typealias HeightForRowAction = (IndexPath) -> Double
public typealias HeightForHeaderAction = (Int) -> Double
public typealias ViewForHeaderAction = (Int) -> UIView?
public typealias HeightForFooterAction = (Int) -> Double
public typealias ViewForFooterAction = (Int) -> UIView?

public final class TableViewDelegate: NSObject {
    public var didSelectRow: DidSelectRowAction?
    public var willDisplayCell: WillDisplayCellAction?
    public var heightForRow: HeightForRowAction?
    public var viewForHeader: ViewForHeaderAction?
    public var heightForHeaderAction: HeightForHeaderAction?
    public var viewForFooter: ViewForFooterAction?
    public var heightForFooterAction: HeightForFooterAction?

    public var scrollViewDidScroll: ScrollViewAction?
    public var scrollViewDidEndDeceleration: ScrollViewAction?
}

extension TableViewDelegate: DelegateProxy {
    public func setDelegate(to object: UITableView) {
        object.delegate = self
    }
}
extension TableViewDelegate: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRow?(indexPath)
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = heightForRow?(indexPath) ?? UITableView.automaticDimension
        return CGFloat(height)
    }

    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        viewForFooter?(section)
    }

    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let height = heightForFooterAction?(section) ?? .zero
        return height
    }

    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        willDisplayCell?(indexPath)
    }
}

public extension TableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollViewDidScroll?(scrollView)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndDeceleration?(scrollView)
    }
}
