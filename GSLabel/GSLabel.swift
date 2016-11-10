//
//  GSLabel.swift
//

import UIKit.UILabel

open class GSLabel: UILabel {
    // MARK: Properties

    open var contentInsets: UIEdgeInsets = .zero {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    // MARK: Initializers

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    // MARK: NSCoding

    override open func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(contentInsets, forKey: PropertyKey.contentInsets)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        contentInsets = aDecoder.decodeUIEdgeInsets(forKey: PropertyKey.contentInsets)
    }

    // MARK: UILabel

    override open func drawText(in rect: CGRect) {
        let newRect = UIEdgeInsetsInsetRect(rect, contentInsets)
        super.drawText(in: newRect)
    }

    // MARK: UIView (UIConstraintBasedLayoutLayering)

    override open var intrinsicContentSize : CGSize {
        let size = super.intrinsicContentSize
        let width = size.width + contentInsets.left + contentInsets.right
        let height = size.height + contentInsets.top + contentInsets.bottom
        return CGSize(width: width, height: height)
    }

    // MARK: Private Constants

    private struct PropertyKey {
        static let contentInsets = "contentInsets"
    }
}
