//
//  ViewPresentation.swift
//
//
//  Created by Yazan Qaisi on 29/05/2024.
//

import Foundation
import UIKit

public protocol ViewPresentation: LoaderPresentation, ViewRoutable, AlertPresentation {}

extension ViewPresentation where Self: UIViewController {}

extension UIViewController: ViewPresentation {}
