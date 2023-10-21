//
//
// NewsApp
// NewsCollectionViewCell.swift
//
// Created by Alexander Kist on 17.10.2023.
//


import UIKit
import SnapKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont(name: TextFont.NewYork.bold.rawValue, size: 20)
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”"
        label.font = UIFont(name: TextFont.Nunito.regular.rawValue, size: 14)
        return label
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flower")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    override func layoutSubviews() {
      super.layoutSubviews()
      layer.cornerRadius = bounds.height / 12
      layer.masksToBounds = true
    }
    
    
    private func setupViews() {
        titleLabel.backgroundColor = .yellow.withAlphaComponent(0.5)
        contentView.backgroundColor = .red.withAlphaComponent(0.2)
        backgroundView = backgroundImageView
//        backgroundColor =
        addSubview(titleLabel)
        addSubview(subTitleLabel)

        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(16)
            make.leading.trailing.equalTo(titleLabel)
            make.bottom.equalToSuperview().inset(8)
        }
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}
