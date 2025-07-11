//
//  LoadingButton.swift
//  
//
//  Created by Yazan Qaisi on 29/06/2022.
//

import UIKit
import Core

public final class LoadingButton: UIButton {
    
    private lazy var indicator: UIActivityIndicatorView = .init(style: .medium)
    
    private var loadingState: LoadingState = .idle
    private var title: String?
    private var image: UIImage?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        indicator.color = backgroundColor?.isDark == true ? .white : .black
        indicator.center = .init(x: frame.size.width / 2, y: frame.size.height / 2)
    }

    public func setLoadingState(_ state: LoadingState) {
        state.isIdle ? hideLoader() : showLoader()
    }

    public override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.4 : 1
        }
    }

    private func showLoader() {
        guard !subviews.contains(indicator) else { return }
        loadingState = .loading
        indicator.style = .medium
        indicator.radius = min(0.7 * frame.height / 2, indicator.radius)
        title = currentTitle
        image = currentImage
        isUserInteractionEnabled = false
        setTitle(nil, for: .normal)
        setImage(nil, for: .normal)
        addSubview(self.indicator)
        loadingState == .loading ? indicator.startAnimating() : hideLoader()
        backgroundColor = .systemGray3
    }

    private func hideLoader() {
        guard subviews.contains(indicator) else { return }
        loadingState = .idle
        isUserInteractionEnabled = true
        setTitle(title, for: .normal)
        setImage(image, for: .normal)
        indicator.stopAnimating()
        indicator.removeFromSuperview()
        configure()
    }
}

public extension LoadingButton {
    func configure(with style: FormButtonStyle = .default) {
        if #available(iOS 15.0, *) { configuration = nil }
        setTitleColor(style.textColor, for: .normal)
        tintColor = style.tintColor
        titleLabel?.font = style.titleFont
        backgroundColor = style.backgroundColor
        layer.cornerRadius = style.cornerRadius ?? layer.cornerRadius
        layer.borderColor = style.borderColor?.cgColor ?? layer.borderColor
        layer.borderWidth = style.borderWidth ?? layer.borderWidth
        circleCorner = style.circleCorner
    }
}
