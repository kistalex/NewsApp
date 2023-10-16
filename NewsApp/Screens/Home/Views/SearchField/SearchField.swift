//
//
// NewsApp
// SearchField.swift
//
// Created by Alexander Kist on 15.10.2023.
//


import UIKit

class SearchField: UITextField {
    
    private let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
    private let leftViewPadding: CGFloat = 8.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSearchField()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = bounds.height / 2
        leftView?.frame = leftViewRect(forBounds: bounds)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSearchField()
    }
    
    private func setupSearchField() {
        searchIcon.tintColor = UIColor(named: ColorName.UnselectedColor.rawValue)
        searchIcon.contentMode = .scaleAspectFit
        leftView = searchIcon
        leftViewMode = .unlessEditing
        placeholder = "Поиск"
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var iconRect = super.leftViewRect(forBounds: bounds)
        iconRect.origin.x += leftViewPadding
        return iconRect
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.textRect(forBounds: bounds)
        textRect.origin.x += leftViewRect(forBounds: bounds).width - leftViewPadding
        return textRect
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}
