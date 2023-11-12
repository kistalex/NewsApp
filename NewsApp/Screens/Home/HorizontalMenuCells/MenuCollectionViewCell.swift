//
//
// NewsApp
// MenuButtonCollectionViewCell.swift
// 
// Created by Alexander Kist on 19.10.2023.
//

import UIKit

final class MenuCollectionViewCell: UICollectionViewCell {

    private let categoryLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: TextFont.Nunito.semiBold.rawValue, size: 14)
        label.textColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    override func layoutSubviews() {
      super.layoutSubviews()
      layer.cornerRadius = bounds.height / 2
      layer.masksToBounds = true
    }

    override var isSelected: Bool {
        didSet {
            backgroundColor = self.isSelected ? .main : .unselected
            categoryLabel.textColor = self.isSelected ? .white : .black
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }

    private func setupViews() {
        backgroundColor = UIColor(named: ColorName.unselectedColor.rawValue)

        contentView.addSubview(categoryLabel)

        categoryLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }

    func configure(with text: String) {
        categoryLabel.text = text
    }
}
