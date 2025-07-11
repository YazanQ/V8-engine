//
//  File.swift
//  
//
//  Created by Yazan Qaisi on 26/05/2024.
//

import Foundation
import UIKit
import SafariServices

public extension UIViewController {

    override func awakeFromNib() {
        super.awakeFromNib()
        navigationController?.view.semanticContentAttribute = .forceRightToLeft
        navigationController?.navigationBar.semanticContentAttribute = .forceRightToLeft
    }

    func add(_ child: UIViewController) {
        addChild(child)
        child.view.addStretchedSubView(to: view)
        child.didMove(toParent: self)
    }

    func add(_ child: UIViewController, to contentView: UIView) {
        addChild(child)
        child.view.addStretchedSubView(to: contentView)
        child.didMove(toParent: self)
    }
    func remove() {
        guard parent != nil else { return }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

public extension UIViewController {
    func openUrlInSafari(url: String?) {
        guard let url = URL(string: url ?? "") else {
            return print("Invalid url......")
        }

        guard UIApplication.shared.canOpenURL(url) else {
            return debugPrint("Cannot open url UIApplication.shared.canOpenURL(url): Invalid")
        }

        let safari = SFSafariViewController(url: url)
        present(safari, animated: true)
    }
}
