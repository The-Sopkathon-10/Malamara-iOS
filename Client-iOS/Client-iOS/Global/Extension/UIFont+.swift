//
//  UIFont.swift
//  Client-iOS
//
//  Created by 김수연 on 2022/05/21.
//

import UIKit

enum FontName: String {

    case hi
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}
