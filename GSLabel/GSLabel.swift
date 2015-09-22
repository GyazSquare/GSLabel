//
//  GSLabel.swift
//

import UIKit.UILabel

public class GSLabel: UILabel {
    // MARK: Properties

    public var contentInsets: UIEdgeInsets = UIEdgeInsetsZero {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    // MARK: UILabel

    override public func drawTextInRect(rect: CGRect) {
        let newRect = UIEdgeInsetsInsetRect(rect, contentInsets)
        super.drawTextInRect(newRect)
    }

    // MARK: UIView (UIConstraintBasedLayoutLayering)

    override public func intrinsicContentSize() -> CGSize {
        let size = super.intrinsicContentSize()
        let width = size.width + contentInsets.left + contentInsets.right
        let height = size.height + contentInsets.top + contentInsets.bottom
        return CGSizeMake(width, height)
    }
}
