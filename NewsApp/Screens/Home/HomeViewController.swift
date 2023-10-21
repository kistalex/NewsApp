//
//
// NewsApp
// HomeViewController.swift
//
// Created by Alexander Kist on 14.10.2023.
//


import UIKit
import SnapKit

class HomeViewController: UIViewController{
    
    private let freshNewsTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setConstraints()
        setupTableView()
    }
    
    private func setupViews() {
        view.addSubview(freshNewsTableView)
    }
    
    private func setupTableView(){
        freshNewsTableView.dataSource = self
        freshNewsTableView.delegate = self
        freshNewsTableView.showsVerticalScrollIndicator = false
        freshNewsTableView.showsHorizontalScrollIndicator = false
        freshNewsTableView.sectionHeaderTopPadding = 0
        freshNewsTableView.separatorStyle = .none
        freshNewsTableView.backgroundColor = .clear
        freshNewsTableView.register(SearchCell.self, forCellReuseIdentifier: "\(SearchCell.self)")
        freshNewsTableView.register(HeaderViewCell.self, forCellReuseIdentifier: "\(HeaderViewCell.self)")
        freshNewsTableView.register(FreshNewsTableViewCell.self, forCellReuseIdentifier: "\(FreshNewsTableViewCell.self)")
        freshNewsTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "\(MenuTableViewCell.self)")
    }
    
    private func setConstraints() {
        freshNewsTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(SearchCell.self)", for: indexPath) as? SearchCell else {
                return UITableViewCell()
            }
            return cell
        }else  if indexPath.row == 1{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(HeaderViewCell.self)", for: indexPath) as? HeaderViewCell else {
                return UITableViewCell()
            }
            return cell
        } else if indexPath.row == 2{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(FreshNewsTableViewCell.self)", for: indexPath) as? FreshNewsTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(MenuTableViewCell.self)", for: indexPath) as? MenuTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
    }
}
// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {

}

