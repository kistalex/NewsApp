//
//
// NewsApp
// HeaderView.swift
//
// Created by Alexander Kist on 15.10.2023.
//


import UIKit
import SnapKit

class HeaderView: UIView {
    
    private let stackView = UIStackView()
    private let header = UILabel()
    private let showAllButton = CustomButton(text: "Больше", imageName: "arrow.forward")
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
        configureLabels()
        configureButton()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureStackView() {
        addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
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
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(40).multipliedBy(1.25)
        }
        showAllButton.snp.makeConstraints { make in
            make.width.equalTo(95)
        }
    }
}

//    label.snp.makeConstraints { make in
//        make.height.equalTo(30)
//    }
//
//    button.snp.makeConstraints { make in
//        make.height.equalTo(30)
//    }
//}

