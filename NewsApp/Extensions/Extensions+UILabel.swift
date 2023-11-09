//
//
// NewsApp
// Extensions+UILabel.swift
// 
// Created by Alexander Kist on 05.11.2023.
//

import UIKit

extension UILabel {
    convenience init(numberOfLines: Int, textColor: UIColor, font: UIFont) {
        self.init()
        self.numberOfLines = numberOfLines
        self.textColor = textColor
        self.font = font
    }
}
