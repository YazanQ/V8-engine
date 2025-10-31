//
//  LoaderPresentation.swift
//
//
//  Created by Yazan Qaisi on 29/05/2024.
//

import UIKit
import ObjectiveC

public protocol LoaderPresentation: AnyObject {
    func showLoading()
    func hideLoading()
}

public extension LoaderPresentation where Self: UIViewController {
    func showLoading() {
        guard view.viewWithTag(999_999) == nil else { return }

        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.color = .white
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()

        indicator.tag = 999_999
        view.addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func hideLoading() {
        view.subviews
            .filter { $0.tag == 999_999 }
            .forEach {
                $0.removeFromSuperview()
            }
    }
}
