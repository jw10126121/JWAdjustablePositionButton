//
//  JWAdjustablePositionButton.swift
//  JWAdjustablePositionButton
//
//  Created by LjwMac on 2019/4/8.
//

import UIKit

/// 可调整按钮位置
enum JWAdjustableButtonPosition: Int {
    /// 图片左、文字右
    case leftImageRightText
    /// 图片右、文字左
    case leftTextRightImage
    /// 图片顶、文字底
    case topImageBottomText
    /// 图片底、文字顶
    case topTextBottomImage
}

extension JWAdjustableButtonPosition: CustomStringConvertible {
    var description: String {
        switch self {
        case .leftImageRightText:
            return "左图右字"
        case .leftTextRightImage:
            return "左字右图"
        case .topImageBottomText:
            return "上图下字"
        case .topTextBottomImage:
            return "上字下图"
        }
    }
}


/// 可调整位置的按钮
class JWAdjustablePositionButton: UIButton {

    #if TARGET_INTERFACE_BUILDER
    /// 位置
    @IBInspectable var position: Int = JWAdjustableButtonPosition.leftImageRightText.rawValue
    #else
    /// 位置
    var position: JWAdjustableButtonPosition = .leftImageRightText {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }
    #endif

    /// 图片与文本间距
    var contentSpace: CGFloat = 5 {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }
    
    /// 自定义图片大小
    var imageSize: CGSize = .zero {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
   
    
    

}

/// 重写对应方法
internal extension JWAdjustablePositionButton {
    
    /// 重写isEnabled
    override var isEnabled: Bool {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }
    
    /// 重写isSelected
    override var isSelected: Bool {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }
    
    /// 重写isHighlighted
    override var isHighlighted: Bool {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }
    
    /// 重写contentVerticalAlignment
    override var contentVerticalAlignment: UIControlContentVerticalAlignment {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }
    
    /// 重写contentHorizontalAlignment
    override var contentHorizontalAlignment: UIControlContentHorizontalAlignment {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }
    
    /// 重写setTitle(_ title: String?, for state: UIControlState)
    override func setTitle(_ title: String?, for state: UIControlState) {
        super.setTitle(title, for: state)
        invalidateIntrinsicContentSize()
        setNeedsLayout()
    }
    
    /// 重写setAttributedTitle(_ title: NSAttributedString?, for state: UIControlState)
    override func setAttributedTitle(_ title: NSAttributedString?, for state: UIControlState) {
        super.setAttributedTitle(title, for: state)
        invalidateIntrinsicContentSize()
        setNeedsLayout()
    }
    
    /// 重写setImage(_ image: UIImage?, for state: UIControlState)
    override func setImage(_ image: UIImage?, for state: UIControlState) {
        super.setImage(image, for: state)
    }
    
    /// 重写contentEdgeInsets
    override var contentEdgeInsets: UIEdgeInsets {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }
    
    /// Fits大小
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return intrinsicContentSize
    }
    
    /// 内在内容大小
    override var intrinsicContentSize: CGSize {
        
        /// 当前内容间距
        let theContentInsets = contentEdgeInsets
        /// 文字大小
        let textSize = calculateTextSize()
        /// 图片大小
        let imageSize = calculateImageSize()
        /// 图片与文字间距
        let margin = (textSize.equalTo(.zero) || imageSize.equalTo(.zero)) ? 0 : contentSpace
        
        /// 算出按钮的最大size
        switch position {
        case .topImageBottomText, .topTextBottomImage:
            let size = CGSize(width: max(textSize.width, imageSize.width) + theContentInsets.left + theContentInsets.right,
                              height: textSize.height + imageSize.height + margin + theContentInsets.top + theContentInsets.bottom)
            return CGRect(origin: .zero, size: size).integral.size
        case .leftImageRightText, .leftTextRightImage:
            let size = CGSize(width: textSize.width + imageSize.width + margin + theContentInsets.left + theContentInsets.right,
                              height: max(textSize.height, imageSize.height) + theContentInsets.top + theContentInsets.bottom)
            return CGRect(origin: .zero, size: size).integral.size
        }
    }

    /// MARK: - TODO
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        /// 文字大小
        var size = super.titleRect(forContentRect: contentRect).size
        if contentVerticalAlignment == .fill {
            size.height = min(size.height, contentRect.height)
        }
        if contentHorizontalAlignment == .fill {
            size.width = min(size.width, contentRect.width)
        }
        
        /// 图片大小
        let imageSize = calculateImageSize()
        /// 图片与文字间距
        let margin = (imageSize.equalTo(.zero)) ? 0 : contentSpace
        
        let totalWidth = size.width + imageSize.width + margin
        let totalHeight = size.height + imageSize.height + margin
        
        var rect = CGRect(origin: .zero, size: size)
        
        switch contentHorizontalAlignment {
            case .center:
                break
            case .left:
                switch position {
                    case .leftImageRightText:
                        rect.origin.x = contentRect.origin.x + totalWidth - size.width
                        break
                    case .topImageBottomText, .topTextBottomImage, .leftTextRightImage:
                        rect.origin.x = contentRect.origin.x
                        break
                }
                break
            case .right:
                switch position {
                    case .leftTextRightImage:
                        rect.origin.x = contentRect.maxX - totalWidth
                        break
                    case .topImageBottomText, .topTextBottomImage, .leftImageRightText:
                        rect.origin.x = contentRect.maxX - size.width
                        break
                }
                break
            case .fill:
                switch position {
                    case .leftImageRightText:
                        break
                    case .leftTextRightImage:
                        break
                    case .topImageBottomText:
                        break
                    case .topTextBottomImage:
                        break
                }
                break
            case .leading:
                switch position {
                    case .leftImageRightText:
                        break
                    case .leftTextRightImage:
                        break
                    case .topImageBottomText:
                        break
                    case .topTextBottomImage:
                        break
                }
                break
            case .trailing:
                switch position {
                    case .leftImageRightText:
                        break
                    case .leftTextRightImage:
                        break
                    case .topImageBottomText:
                        break
                    case .topTextBottomImage:
                        break
                }
                break
        }
        
        switch contentVerticalAlignment {
            case .center:
                switch position {
                    case .leftImageRightText:
                        break
                    case .leftTextRightImage:
                        break
                    case .topImageBottomText:
                        break
                    case .topTextBottomImage:
                        break
                }
                break
            case .top:
                switch position {
                    case .leftImageRightText:
                        break
                    case .leftTextRightImage:
                        break
                    case .topImageBottomText:
                        break
                    case .topTextBottomImage:
                        break
                }
                break
            case .bottom:
                switch position {
                    case .leftImageRightText:
                        break
                    case .leftTextRightImage:
                        break
                    case .topImageBottomText:
                        break
                    case .topTextBottomImage:
                        break
                }
                break
            case .fill:
                switch position {
                    case .leftImageRightText:
                        break
                    case .leftTextRightImage:
                        break
                    case .topImageBottomText:
                        break
                    case .topTextBottomImage:
                        break
                }
                break
        }
        
        return rect
    }
    
    /// MARK: - TODO
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return super.imageRect(forContentRect: contentRect)
    }
    
}

fileprivate extension JWAdjustablePositionButton {
    
    func setupUI() {
        autoresizesSubviews = false
    }
    
    /// 计算文本大小
    func calculateTextSize() -> CGSize {
        
        var size = CGSize.zero
        
        if let currentAttributedTitle = currentAttributedTitle {
            size = currentAttributedTitle.size()
        } else if let currentTitle = currentTitle {
            size = (currentTitle as NSString).size(withAttributes: [.font : titleLabel?.font as Any])
        }
        
        return size
        
    }
    
    /// 获取图片大小
    func calculateImageSize() -> CGSize {
        
        if imageSize.equalTo(.zero) {
            return currentImage?.size ?? .zero
        }
        
        if currentImage != nil {
            return imageSize
        }
        
        return .zero
        
    }
    
}
