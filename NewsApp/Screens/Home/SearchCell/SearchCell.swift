//
//
// NewsApp
// SearchCell.swift
//
// Created by Alexander Kist on 21.10.2023.
//


import UIKit
import SnapKit

class SearchCell: UITableViewCell {
    private var searchField = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupView() {
        searchField.placeholder = "Поиск"
        searchField.borderStyle = .none
        
        searchField.layer.cornerRadius = frame.height / 2
        searchField.clipsToBounds = true
        searchField.layer.borderColor = UIColor(named: ColorName.UnselectedColor.rawValue)?.cgColor
        searchField.layer.borderWidth = 1
        
        searchField.backgroundColor = .white
        searchField.textColor = .black
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: searchField.frame.height))
        searchField.leftView = leftView
        searchField.leftViewMode = .always
        
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: searchField.frame.height))
        searchField.rightView = rightView
        searchField.rightViewMode = .always
        
        contentView.addSubview(searchField)
        contentView.backgroundColor = .white
       
        
    }
    
    private func setConstraints(){
        searchField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
}

