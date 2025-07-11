//
//  File.swift
//  
//
//  Created by Yazan Qaisi on 27/05/2024.
//

import UIKit
import Core

public class SocialMediaButton: UIButton {
    private var action: Handler?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        
    }

    @discardableResult
    public func setAction(_ action: @escaping Handler) -> Self {
        self.action = action
        return self
    }

    @IBAction
    private func didTapButton(_ sender: UIButton) {
        action?()
    }
}
