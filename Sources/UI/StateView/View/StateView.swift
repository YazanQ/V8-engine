//
//  StateView.swift
//  
//
//  Created by Yazan Qaisi on 05/06/2024.
//

import UIKit
import Core

public final class StateView: UIView {

    // MARK: Outlets

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    // MARK: Property

    private let state: ListState<Any>

    // MARK: LifeCycle

    public required init(_ state: ListState<Any>) {
        self.state = state
        super.init(frame: .zero)
        setupViews()
    }

    public required init?(coder: NSCoder) { nil }

    // MARK: - Configuration

    private func setupViews() {
        loadFromNib(using: .bundle(forResource: "\(Self.self)"))
        imageView.image = state.image
        imageView.isHidden = state.image.isNil
        messageLabel.text = state.message
        activityIndicator.isHidden = !state.isLoading
    }
}
