//
//
// NewsApp
// MenuTableViewCell.swift
// 
// Created by Alexander Kist on 19.10.2023.
//

import UIKit

final class MenuTableViewCell: UITableViewCell {

    private let menuCategories = ["Business", "Entertainment", "General", "Health", "Science", "Sports", "Technology"]

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        NotificationCenter.default.post(name: Notification.Name("CategorySelected"), object: nil, userInfo: ["category": menuCategories.first?.lowercased() ?? ""])
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupViews() {
        contentView.addSubview(collectionView)
        backgroundColor = .none
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceHorizontal = true
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: "\(MenuCollectionViewCell.self)")
        collectionView.selectItem(at: [0,0], animated: true, scrollPosition: .centeredHorizontally)
    }

    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(20)
            make.height.equalTo(40).multipliedBy(0.4)
        }
    }
}

// MARK: - UICollectionViewDelegate
extension MenuTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCategory = menuCategories[indexPath.row].lowercased()
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        NotificationCenter.default.post(name: Notification.Name("CategorySelected"), object: nil, userInfo: ["category": selectedCategory])
    }
}

// MARK: - UICollectionViewDataSource
extension MenuTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuCategories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MenuCollectionViewCell.self)", for: indexPath) as? MenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = menuCategories[indexPath.item]
        cell.configure(with: item)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MenuTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame
        let categoryFont = UIFont(name: TextFont.Nunito.semiBold.rawValue, size: 14)
        let categoryAttributes = [NSAttributedString.Key.font: categoryFont as Any]
        let categoryWidth = menuCategories[indexPath.item].size(withAttributes: categoryAttributes).width
        return CGSize(width: categoryWidth + 20 , height: size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
}
