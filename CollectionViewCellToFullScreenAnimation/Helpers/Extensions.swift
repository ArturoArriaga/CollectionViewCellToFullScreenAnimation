//
//  Helpers.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 1/31/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
}

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}

struct CustomFonts {
    static let rubikMedium = "Rubik-Medium"
    static let rubikRegular = "Rubik-Regular"
    static let rubikLight = "Rubik-Light"
    static let HomemadeApple = "HomemadeApple-Regular"
}
