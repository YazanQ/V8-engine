//
//  ImageLoader.swift
//
//
//  Created by Yazan Qaisi on 27/02/2024.
//

import UIKit

public protocol ImageLoader: AnyObject {
    func loadImage(from url: URL?, handler: @escaping (Result<UIImage, Error>) -> Void)
}

public extension ImageLoader {
    func loadImage(from stringUrl: String?, handler: @escaping (Result<UIImage, Error>) -> Void) {
        loadImage(from: .init(string: stringUrl ?? ""), handler: handler)
    }
}
