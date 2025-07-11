//
//  PaddingLabel.swift
//
//
//  Created by Yazan Qaisi on 18/07/2024.
//

import UIKit

@IBDesignable 
public class PaddingLabel: UILabel {

    @IBInspectable public var topInset: CGFloat = 3.0
    @IBInspectable public var bottomInset: CGFloat = 3.0
    @IBInspectable public var leftInset: CGFloat = 16.0
    @IBInspectable public var rightInset: CGFloat = 15.0

    public override func drawText(
        in rect: CGRect
    ) {
        let insets = UIEdgeInsets(
            top: topInset,
            left: leftInset,
            bottom: bottomInset,
            right: rightInset
        )
        super.drawText(
            in: rect.inset(
                by: insets
            )
        )
    }

    public override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + leftInset + rightInset,
            height: size.height + topInset + bottomInset
        )
    }

    public override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-
            preferredMaxLayoutWidth = bounds.width - (
                leftInset + rightInset
            )
        }
    }
}
