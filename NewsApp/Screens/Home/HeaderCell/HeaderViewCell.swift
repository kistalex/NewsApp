//
//
// NewsApp
// HeaderViewCell.swift
//
// Created by Alexander Kist on 15.10.2023.
//


import UIKit
import SnapKit

class HeaderViewCell: UITableViewCell {
    
    private let stackView = UIStackView()
    private let header = UILabel()
    private let showAllButton = CustomButton(text: "Больше", imageName: "chevron.right")

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureStackView()
        configureLabels()
        configureButton()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func configureStackView() {
        contentView.addSubview(stackView)
        contentView.backgroundColor = .white
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .white
    }
    
    private func configureLabels() {
        stackView.addArrangedSubview(header)
        header.text = "Последнее🔥"
        header.font = UIFont(name: TextFont.NewYork.bold.rawValue, size: 18)
        header.textColor = .black
    }
    
    private func configureButton() {
        stackView.addArrangedSubview(showAllButton)
        showAllButton.addTarget(self, action: #selector(showAllButtonPressed), for: .touchUpInside)
    }
    
    @objc func showAllButtonPressed(){
        print("More")
    }
    
    private func setConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        showAllButton.snp.makeConstraints { make in
            make.width.equalTo(95)
        }
    }
}

