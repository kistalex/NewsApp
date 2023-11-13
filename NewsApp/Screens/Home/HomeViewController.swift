//
//
// NewsApp
// HomeViewController.swift
//
// Created by Alexander Kist on 14.10.2023.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {

    private let freshNewsTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Главное"
        setupViews()
        setConstraints()
        setupTableView()
        setupSearchBarItem()
    }
    private func setupViews() {
        view.addSubview(freshNewsTableView)
    }

    private func setupTableView() {
        freshNewsTableView.dataSource = self
        freshNewsTableView.showsVerticalScrollIndicator = false
        freshNewsTableView.showsHorizontalScrollIndicator = false
        freshNewsTableView.separatorStyle = .none
        freshNewsTableView.backgroundColor = .clear
        freshNewsTableView.allowsSelection = true
        freshNewsTableView.estimatedRowHeight = UITableView.automaticDimension
        freshNewsTableView.register(HeaderViewCell.self, forCellReuseIdentifier: "\(HeaderViewCell.self)")
        freshNewsTableView.register(TopArticlesTableViewCell.self, forCellReuseIdentifier: "\(TopArticlesTableViewCell.self)")
        freshNewsTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "\(MenuTableViewCell.self)")
        freshNewsTableView.register(CategoryArticlesTableCell.self, forCellReuseIdentifier: "\(CategoryArticlesTableCell.self)")
    }

    private func setupSearchBarItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .search, primaryAction: UIAction(handler: { _ in
            let searchVC = SearchViewController()
            searchVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(searchVC, animated: true)
        }))
        navigationItem.rightBarButtonItem?.tintColor = .main
    }

    private func setConstraints() {
        freshNewsTableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.snp.bottom)
        }
    }

}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 0 {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(SearchCell.self)", for: indexPath) as? SearchCell else {
//                return UITableViewCell()
//            }
//            return cell
  /*      } else*/  if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(HeaderViewCell.self)", for: indexPath) as? HeaderViewCell else {
                return UITableViewCell()
            }
            return cell
        } else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(TopArticlesTableViewCell.self)", for: indexPath) as? TopArticlesTableViewCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            return cell
        } else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(MenuTableViewCell.self)", for: indexPath) as? MenuTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CategoryArticlesTableCell.self)", for: indexPath) as? CategoryArticlesTableCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            return cell
        }
    }
}

extension HomeViewController: TopArticlesTableViewCellDelegate {
    func topArticlesTableViewCell(_ topArticlesTableViewCell: TopArticlesTableViewCell, didSelectArticle article: Article) {
        let viewModel = ArticleDetailViewModel(article: article)
        let detailVC = NewsDetailViewController(viewModel: viewModel)
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeViewController: CategoryArticlesTableCellDelegate {
    func categoryArticlesTableViewCell(_ categoryArticlesTableViewCell: CategoryArticlesTableCell, didSelectArticle article: Article) {
        let viewModel = ArticleDetailViewModel(article: article)
        let detailVC = NewsDetailViewController(viewModel: viewModel)
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
