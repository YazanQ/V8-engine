//
//  File.swift
//  
//
//  Created by Yazan Qaisi on 02/06/2024.
//

import UIKit
import Kingfisher

public extension UIImageView {
    func setImage(imageName: String?, placeholder: UIImage? = nil) {
        setImage(with: .init(string: imageName ?? ""), placeholder: placeholder)
    }
    func setImage(with url: URL?, placeholder: UIImage? = nil) {
        guard let url else {
            image = placeholder
            return
        }

        kf.indicatorType = .activity
        kf.setImage(with: url, placeholder: placeholder) { results in
            switch results {
            case let .success(value):
                self.image = value.image
            case let .failure(error):
                debugPrint("Kingfisher setImage(named:placeholder) failed: \(error.localizedDescription)")
            }
        }
    }
}
