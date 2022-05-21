//
//  UIStackView+.swift
//  Client-iOS
//
//  Created by 김수연 on 2022/05/21.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
