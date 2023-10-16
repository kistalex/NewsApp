//
//
// NewsApp
// HomeViewController.swift
//
// Created by Alexander Kist on 14.10.2023.
//

//UIImage(systemName: "line.3.horizontal.decrease")


import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let searchField = SearchField()
    private let notificationButton = NotificationButton()
    
    private let headerView = HeaderView()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(searchField)
        contentView.addSubview(notificationButton)
        contentView.addSubview(headerView)
        
        searchField.textColor = .black
        searchField.layer.borderColor = UIColor.black.cgColor
        
    }
    
    private func setupConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView.snp.width)
        }
        
        searchField.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.trailing.equalTo(notificationButton.snp.leading).offset(-20)
            make.height.equalTo(50).multipliedBy(1.25)
        }
        
        notificationButton.snp.makeConstraints { make in
            make.top.equalTo(searchField.snp.top)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
            make.height.width.equalTo(50).multipliedBy(1.25)
            
        }
        
        headerView.snp.makeConstraints { make in
            make.top.equalTo(searchField.snp.bottom).offset(15)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
        }
    }
}

