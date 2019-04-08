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
    case iconLeftTextRight
    /// 图片右、文字左
    case iconRightTextLeft
    /// 图片顶、文字底
    case iconTopTextBottom
    /// 图片底、文字顶
    case iconBottomTextTop
}


/// 可调整位置的按钮
class JWAdjustablePositionButton: UIButton {

    /// 位置
    var position: JWAdjustableButtonPosition = .iconLeftTextRight
    
//    var icon
    

}
