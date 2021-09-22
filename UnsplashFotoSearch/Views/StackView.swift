//
//  StackView.swift
//  UnsplashFotoSearch
//
//  Created by Стас Жингель on 21.09.2021.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
    }
}
