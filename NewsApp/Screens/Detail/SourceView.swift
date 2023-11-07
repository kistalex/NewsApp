//
//
// NewsApp
// SourceView.swift
//
// Created by Alexander Kist on 07.11.2023.
//

import UIKit

final class SourceView: UIView {
        
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: TextFont.NewYork.bold.rawValue, size: 20)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: TextFont.Nunito.semiBold.rawValue, size: 14)
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: TextFont.Nunito.extraBold.rawValue, size: 14)
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    private let blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.layer.cornerRadius = view.bounds.height / 4
        view.clipsToBounds = true
        return view
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    private let backgroundImageView = UIImageView()
    private let contentContainerView = UIView()
    private let scrollView = UIScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraint()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = bounds.height / 4
        layer.masksToBounds = true
    }
    
    private func setupViews() {
        
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(authorLabel)
        
        addSubview(scrollView)
        scrollView.addSubview(contentContainerView)
        contentContainerView.addSubview(backgroundImageView)
        contentContainerView.addSubview(blurView)
        contentContainerView.addSubview(contentLabel)
        blurView.contentView.addSubview(stackView)
    }
    
    private func setConstraint() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        blurView.snp.makeConstraints { make in
            make.centerY.equalTo(backgroundImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(blurView.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview().inset(15)
        }
    }
}
