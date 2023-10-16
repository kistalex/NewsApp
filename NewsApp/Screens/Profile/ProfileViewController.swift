//
//
// NewsApp
// ProfileViewController.swift
// 
// Created by Alexander Kist on 15.10.2023.
//


import UIKit

class ProfileViewController: UIViewController {
    private let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        view.addSubview(label)
        label.text = "Профиль"
        label.font = UIFont(name: TextFont.NewYork.bold.rawValue, size: 20)
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
