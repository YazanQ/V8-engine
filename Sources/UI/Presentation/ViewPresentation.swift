//
//  ViewPresentation.swift
//
//
//  Created by Yazan Qaisi on 17/03/2024.
//

import Foundation
import UIKit

public protocol ViewPresentation: LoaderPresentation {}

extension ViewPresentation where Self: UIViewController {}

extension UIViewController: ViewPresentation {}
