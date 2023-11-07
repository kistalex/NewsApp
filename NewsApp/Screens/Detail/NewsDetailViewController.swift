//
//
// NewsApp
// NewsDetailViewController.swift
//
// Created by Alexander Kist on 07.11.2023.
//

import UIKit

final class NewsDetailViewController: UIViewController {
    
    init(viewModel: NewsDetailViewModel) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }
}
