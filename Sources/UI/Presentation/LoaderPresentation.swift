//
//  LoaderPresentation.swift
//
//
//  Created by Yazan Qaisi on 17/03/2024.
//

import UIKit
import ProgressHUD

public protocol LoaderPresentation: AnyObject {
    func showLoading()
    func hideLoading()
}

public extension LoaderPresentation where Self: UIViewController {
    func showLoading() {
        ProgressHUD.show(interaction: false)
    }

    func hideLoading() {
        ProgressHUD.dismiss()
    }
}
