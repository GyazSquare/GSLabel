//
//  GSLabel.swift
//

import UIKit.UILabel

public class GSLabel: UILabel {
    // MARK: Constants

    private struct PropertyKey {
        static let contentInsets = "contentInsets"
    }

    // MARK: Properties

    public var contentInsets: UIEdgeInsets = UIEdgeInsetsZero {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    // MARK: Initializers

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    // MARK: NSCoding

    override public func encodeWithCoder(aCoder: NSCoder) {
        super.encodeWithCoder(aCoder)
        aCoder.encodeUIEdgeInsets(contentInsets, forKey: PropertyKey.contentInsets)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        contentInsets = aDecoder.decodeUIEdgeInsetsForKey(PropertyKey.contentInsets)
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
